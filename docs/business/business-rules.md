# Reglas de Negocio

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Documentar las reglas de negocio que gobiernan el funcionamiento de SIGCA.

Estas reglas representan el comportamiento esperado del sistema y deberán respetarse durante el diseño de la base de datos, el desarrollo del backend, el frontend y los procesos administrativos.

Toda modificación futura deberá actualizar este documento antes de implementarse en el software.

---

# Reglas Generales

## GR-001

SIGCA deberá permitir administrar múltiples parroquias en versiones futuras.

La primera versión operará únicamente con una parroquia.

---

## GR-002

Cada parroquia tendrá una única sede.

---

## GR-003

Toda la información histórica deberá conservarse.

No se eliminarán registros históricos de operación.

---

## GR-004

El sistema utilizará identificadores permanentes para las personas registradas.

---

# Ciclos

## CY-001

Solo podrá existir un Ciclo Activo.

---

## CY-002

Al finalizar un ciclo, éste pasará al estado Archivado.

---

## CY-003

Los ciclos archivados permanecerán disponibles para consultas y reportes.

---

## CY-004

Los alumnos deberán reinscribirse manualmente para participar en un nuevo ciclo.

---

# Libros

## LIB-001

Cada Libro representa un año completo de formación catequética.

---

## LIB-002

Un Libro podrá tener múltiples grupos dentro del mismo Ciclo.

---

# Grupos

## GRP-001

Cada Grupo pertenece a un único Libro.

---

## GRP-002

Cada Grupo pertenece a un único Ciclo.

---

## GRP-003

Cada Grupo tendrá exactamente un Catequista.

---

## GRP-004

Cada Grupo tendrá exactamente un Auxiliar.

---

## GRP-005

El Catequista y el Auxiliar no podrán modificarse una vez iniciado el Ciclo, salvo por autorización administrativa extraordinaria.

---

# Catequistas

## CAT-001

Un Catequista únicamente podrá estar asignado a un Grupo activo.

---

## CAT-002

Un Catequista no podrá desempeñarse simultáneamente como Auxiliar de otro Grupo.

---

# Alumnos

## AL-001

El Alumno representa a la persona y conservará su historial durante toda su permanencia en la parroquia.

---

## AL-002

Un Alumno únicamente podrá tener una Inscripción activa por Ciclo.

---

## AL-003

Un Alumno podrá cambiar de Grupo únicamente si permanece dentro del mismo Libro.

---

## AL-004

Los cambios de Grupo deberán conservar trazabilidad.

---

## AL-005

El historial del Alumno nunca será eliminado.

---

# Inscripciones

## IN-001

Toda operación académica pertenece a la Inscripción y no directamente al Alumno.

---

## IN-002

Cada Inscripción estará asociada a:

* Alumno
* Ciclo
* Libro
* Grupo
* Tutor

---

## IN-003

Las Asistencias pertenecen a la Inscripción.

---

## IN-004

Las Evaluaciones pertenecen a la Inscripción.

---

## IN-005

La Credencial pertenece a la Inscripción.

---

## IN-006

El Certificado pertenece a la Inscripción.

---

# Tutores

## TUT-001

Cada Inscripción tendrá un único Tutor responsable.

---

## TUT-002

Un Tutor podrá estar asociado a múltiples Alumnos.

---

## TUT-003

El Tutor podrá cambiar entre Ciclos.

---

# Sacramentos

## SAC-001

El sistema administrará inicialmente:

* Bautismo
* Primera Comunión
* Confirmación

---

## SAC-002

El sistema almacenará la fecha y la parroquia donde se celebró el Sacramento cuando aplique.

---

# Código QR

## QR-001

Cada Alumno tendrá un único Código QR permanente.

---

## QR-002

El Código QR nunca cambiará durante la permanencia del Alumno en la parroquia.

---

## QR-003

La reimpresión de Credenciales conservará el mismo Código QR.

---

## QR-004

El Código QR identifica únicamente al Alumno.

---

# Credenciales

## CRT-001

Cada Ciclo generará una nueva Credencial.

---

## CRT-002

La Credencial deberá mostrar:

* Fotografía
* Nombre
* Libro
* Grupo
* Código QR

---

# Eventos

## EV-001

Todo registro de asistencia deberá pertenecer a un Evento.

---

## EV-002

Los Eventos podrán clasificarse como:

* Clase
* Misa
* Retiro
* Confesión
* Plática
* Actividad Especial

---

## EV-003

Los Eventos podrán requerir control de asistencia.

---

## EV-004

Todo Evento podrá generar una o más Sesiones de Evento.

---

## EV-005

Las asistencias siempre se registrarán sobre una Sesión de Evento.

---

## EV-006

Una Sesión de Evento podrá cancelarse o reprogramarse sin modificar el Evento original.

---

## EV-007

El sistema permitirá generar automáticamente las Sesiones de Evento a partir de la configuración del Evento.

---

# Asistencias

## ATT-001

Las asistencias se registrarán por Evento.

---

## ATT-002

Una asistencia podrá registrarse mediante:

* Código QR
* Captura manual autorizada

---

## ATT-003

Una ausencia de registro será considerada como Falta.

---

## ATT-004

Una asistencia podrá marcarse como Justificada.

---

## ATT-005

Las modificaciones posteriores deberán registrar:

* Usuario que realizó el cambio
* Fecha y hora
* Justificación

---

## ATT-006

El sistema registrará el usuario que realizó el escaneo del Código QR.

---

## ATT-007

El sistema registrará la fecha y hora exacta del registro.

---

## ATT-008

Se permitirá registrar asistencias manuales para eventos celebrados en otras parroquias mediante autorización del Catequista.

---

# Evaluaciones

## EVA-001

La aprobación requerirá cumplir el porcentaje mínimo de asistencia definido por la parroquia.

---

## EVA-002

La evaluación podrá considerar exámenes.

---

# Certificados

## CER-001

Los Certificados únicamente podrán emitirse cuando el Alumno haya cumplido todos los requisitos establecidos por la parroquia.

---

# Reportes

## REP-001

Toda la información histórica deberá permanecer disponible para reportes.

---

## REP-002

Los reportes deberán poder generarse por:

* Ciclo
* Libro
* Grupo
* Catequista
* Alumno
* Evento

---

# Auditoría

## AUD-001

Toda modificación importante deberá conservar información de auditoría.

---

## AUD-002

El sistema deberá identificar el usuario responsable de cada operación relevante.

---

# Consideraciones Futuras

Las siguientes funcionalidades podrán incorporarse en versiones posteriores sin modificar las reglas fundamentales del sistema:

* Administración de múltiples parroquias.
* Múltiples sedes por parroquia.
* Nuevos tipos de eventos.
* Nuevos sacramentos.
* Integración con sistemas parroquiales externos.
* Notificaciones automáticas.
* Portal para padres de familia.
* Aplicación móvil.
