# Glosario de Negocio

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Definir la terminología oficial utilizada dentro del proyecto SIGCA.

Todas las especificaciones, documentos funcionales, modelos de datos, código fuente y manuales deberán utilizar las definiciones contenidas en este documento.

Una palabra definida en este glosario tendrá un único significado dentro del sistema.

---

# A

## Administrador

Usuario responsable de la administración técnica y funcional del sistema.

Tiene acceso completo a la configuración y operación de SIGCA.

---

## Alumno

Persona inscrita en el proceso de formación catequética.

El Alumno representa a la persona y existe independientemente de los ciclos, grupos o libros en los que participe.

El Alumno conserva su historial durante toda su permanencia en la parroquia.

---

## Asistencia

Registro que indica la participación de una inscripción en un Evento determinado.

Una asistencia puede registrarse mediante escaneo de código QR o captura manual autorizada.

---

## Auxiliar

Persona asignada para apoyar al Catequista durante un ciclo.

Cada Grupo tendrá un único Auxiliar.

---

# C

## Catequista

Responsable principal de impartir la formación catequética a un Grupo durante un Ciclo.

Un Catequista únicamente podrá estar asignado a un Grupo activo.

---

## Certificado

Documento emitido por la parroquia que acredita el cumplimiento de los requisitos establecidos para concluir un Libro.

---

## Ciclo

Periodo anual de formación catequética.

Ejemplo:

2026–2027

Solo puede existir un Ciclo activo.

---

## Credencial

Documento emitido para identificar al Alumno durante un Ciclo.

La Credencial contiene información del Grupo, Libro y Código QR del Alumno.

Cada Ciclo genera una nueva Credencial.

---

# E

## Evento

Actividad organizada por la parroquia que puede requerir control de asistencia.

Ejemplos:

* Clase
* Misa
* Retiro
* Plática
* Confesión
* Actividad especial

Todos los eventos utilizan el mismo mecanismo de registro de asistencia.

## Sesión de Evento

Representa una ocurrencia específica de un Evento planificado.

Ejemplos:

- Clase del Libro 1 del miércoles 10 de septiembre.
- Misa dominical del 15 de noviembre a las 10:00.
- Retiro de Adviento del 6 de diciembre.

Una Sesión de Evento tiene una fecha, una hora, un estado y constituye la unidad sobre la cual se registran las asistencias.

Un Evento puede generar una o muchas Sesiones de Evento.

---

# G

## Grupo

Conjunto de alumnos inscritos en un mismo Libro durante un Ciclo determinado.

Cada Grupo posee:

* Nombre
* Libro
* Horario
* Salón
* Catequista
* Auxiliar

Un Grupo pertenece a un único Ciclo.

---

# I

## Inscripción

Proceso mediante el cual un Alumno queda registrado para participar en un Libro y Grupo durante un Ciclo específico.

La Inscripción representa la participación anual del Alumno.

Toda la información operativa del ciclo pertenece a la Inscripción.

Ejemplos:

* Grupo asignado
* Tutor
* Asistencias
* Evaluaciones
* Certificados
* Estado

Un Alumno puede tener múltiples Inscripciones a lo largo de su historial, pero únicamente una Inscripción activa por Ciclo.

---

# L

## Libro

Nivel de formación catequética correspondiente a un año específico del programa.

Ejemplos:

Libro 1

Libro 2

Libro 3

Un Libro puede tener varios Grupos durante el mismo Ciclo.

---

# M

## Misa

Evento religioso que forma parte de la formación catequética y cuya asistencia puede registrarse mediante Código QR.

Se consideran válidas las misas dominicales y la misa vespertina del sábado.

---

# P

## Parroquia

Entidad principal del sistema.

En la primera versión SIGCA administrará una única Parroquia.

La arquitectura permitirá administrar múltiples parroquias en futuras versiones.

---

# Q

## Código QR

Identificador permanente del Alumno.

El Código QR nunca cambia durante la permanencia del Alumno en la parroquia.

La reimpresión de Credenciales conserva el mismo Código QR.

El Código QR no identifica la inscripción; identifica únicamente al Alumno.

---

# R

## Reinscripción

Proceso mediante el cual un Alumno obtiene una nueva Inscripción para un nuevo Ciclo.

La Reinscripción requiere verificar previamente el cumplimiento de los requisitos establecidos por la coordinación.

---

# S

## Sacramento

Celebración religiosa registrada dentro del historial del Alumno.

SIGCA administrará inicialmente:

* Bautismo
* Primera Comunión
* Confirmación

---

# T

## Tutor

Persona responsable del Alumno durante un Ciclo específico.

El Tutor pertenece a la Inscripción y puede cambiar entre ciclos.

Un Tutor puede estar asociado a varios Alumnos.

---

# U

## Usuario

Persona con acceso autorizado al sistema SIGCA.

Los Usuarios pueden desempeñar distintos roles funcionales, tales como:

* Administrador
* Coordinador General
* Catequista
* Auxiliar
* Voluntario de Registro de Asistencia
* Consulta

---

# V

## Voluntario de Registro de Asistencia

Usuario autorizado únicamente para registrar asistencias mediante el escaneo del Código QR durante Eventos.

No posee permisos administrativos ni acceso a la gestión de información académica.

---

# Convenciones

Toda la documentación del proyecto deberá utilizar las definiciones contenidas en este glosario.

Cuando se incorporen nuevos conceptos funcionales, deberán agregarse primero a este documento antes de ser utilizados en nuevas especificaciones o módulos del sistema.
