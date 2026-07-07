# BRQ-001 - Catechesis Requirements Questionnaire

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Documentar los requerimientos funcionales obtenidos durante el levantamiento inicial del proyecto SIGCA.

Este documento constituye la fuente oficial de información del negocio y servirá como base para la definición del modelo de dominio, reglas de negocio, modelo relacional y especificaciones técnicas posteriores.

---

# 1. Organización de la Parroquia

## BRQ-001.1 Administración de parroquias

En la primera versión del sistema se administrará una única parroquia.

La arquitectura deberá permitir escalar a múltiples parroquias en versiones futuras sin requerir cambios importantes en el modelo de datos.

## BRQ-001.2 Sedes

Cada parroquia administrará una única sede física.

## BRQ-001.3 Administración del sistema

El sistema será administrado por un responsable técnico (Consultor IT). Los usuarios operativos tendrán permisos definidos por su rol.

---

# 2. Ciclos Catequéticos

## BRQ-002.1 Ciclo activo

Solo podrá existir un ciclo activo al mismo tiempo.

## BRQ-002.2 Finalización

Al concluir un ciclo:

* Se archiva.
* Conserva toda su información.
* Permanece disponible para consultas y estadísticas.

## BRQ-002.3 Reinscripción

Los alumnos no pasan automáticamente al siguiente ciclo.

Cada alumno deberá reinscribirse después de validar los requisitos establecidos por la coordinación.

---

# 3. Libros

## BRQ-003.1 Definición

Cada Libro representa un año completo de formación catequética.

Ejemplos:

* Libro 1
* Libro 2
* Libro 3

## BRQ-003.2 Grupos

Un mismo Libro puede tener varios grupos.

Ejemplos:

* Libro 1 - Grupo Miércoles
* Libro 1 - Grupo Sábado

---

# 4. Grupos

Cada grupo estará definido por:

* Nombre
* Libro
* Horario
* Día de la semana
* Salón
* Catequista titular
* Auxiliar

Restricciones:

* El catequista no cambia durante el ciclo.
* Solo existe un auxiliar por grupo.

---

# 5. Catequistas

Información requerida:

* Nombre completo
* Fecha de nacimiento
* Teléfono
* Correo electrónico
* Dirección
* Fotografía
* Fecha de ingreso
* Estado (Activo / Inactivo)

Restricciones:

* Un catequista solo puede atender un grupo.
* No puede ser auxiliar de otro grupo.

---

# 6. Alumnos

Información requerida:

* Nombre completo
* Fecha de nacimiento
* CURP
* Sexo
* Fotografía
* Formación catequética previa
* Primera Comunión
* Tutor
* Alergias o padecimientos
* Estado (Activo / Inactivo)

Restricciones:

* Solo una inscripción por ciclo.
* Puede cambiar de grupo únicamente dentro del mismo Libro.
* Conserva historial completo de ciclos anteriores.
* No puede abandonar un ciclo para reincorporarse posteriormente.

---

# 7. Tutores

Cada inscripción tendrá un único tutor responsable.

Un tutor podrá estar asociado a varios alumnos.

Información requerida:

* Nombre completo
* Teléfono
* Celular
* Correo electrónico
* Parentesco
* Contacto adicional
* Teléfono del contacto adicional
* Parentesco del contacto adicional

---

# 8. Sacramentos

Se registrarán:

* Bautismo
* Primera Comunión
* Confirmación

Información:

* Fecha del sacramento (cuando aplique)
* Parroquia donde fue celebrado

No se almacenarán documentos digitales.

---

# 9. Asistencias

## Curso

Cada sesión tendrá:

* Fecha
* Grupo
* Registro por Catequista o Auxiliar

Estados:

* Asistencia
* Justificada

La ausencia de registro se interpreta como Falta.

Las asistencias podrán modificarse posteriormente por el Catequista o un Administrador, registrando una justificación.

## Misa

Las asistencias a misa se registrarán mediante código QR.

Características:

* Escaneo desde dispositivos móviles.
* Registro de usuario que realizó el escaneo.
* Registro de fecha y hora.
* Existencia de varias misas por domingo.
* La misa del sábado por la tarde será considerada como asistencia dominical.

También será posible registrar asistencias manuales cuando un alumno presente comprobante de participación en otra parroquia.

---

# 10. Código QR

El QR identificará únicamente al Alumno.

Características:

* Permanente.
* No cambia entre ciclos.
* No cambia al reimprimir credenciales.
* Al escanearlo, el sistema localizará automáticamente la inscripción activa del alumno.

---

# 11. Credenciales

Cada ciclo generará una nueva credencial.

Información:

* Fotografía
* Nombre
* Libro
* Grupo
* Código QR

---

# 12. Evaluación

La aprobación considera:

* Examen
* Asistencia mínima del 80%

---

# 13. Certificados

Al concluir satisfactoriamente un Libro se emitirá un certificado de cumplimiento.

---

# 14. Usuarios del Sistema

Roles identificados:

* Administrador
* Coordinador General
* Catequista
* Auxiliar
* Voluntario de Registro de Asistencia
* Consulta

---

# 15. Reportes

Reportes requeridos:

* Asistencia por alumno.
* Asistencia por grupo.
* Asistencia por catequista.
* Alumnos con faltas.
* Alumnos sin sacramentos.
* Estadísticas por ciclo.
* Asistencias por misa.

---

# 16. Reglas de Negocio Identificadas

* Asistencia mínima del 80%.
* Las faltas podrán justificarse.
* No existen clases de recuperación.
* No existe límite de edad por Libro.
* No se aceptan inscripciones a mitad del ciclo.
* El sistema deberá permitir registrar asistencia a eventos adicionales como retiros, pláticas, confesiones y actividades extraordinarias.

---

# Observaciones

Este documento representa el levantamiento inicial del negocio y constituye la base para el diseño del modelo de dominio de SIGCA.

Cualquier modificación futura deberá registrarse mediante una nueva revisión del presente documento y reflejarse en las especificaciones correspondientes.
