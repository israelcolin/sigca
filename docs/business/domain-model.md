# Modelo del Dominio

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Definir el modelo conceptual del dominio de negocio de SIGCA.

Este documento describe las entidades principales, sus responsabilidades y la forma en que interactúan dentro de la operación de la catequesis.

No representa un modelo de base de datos ni una implementación técnica.

---

# Visión General del Dominio

SIGCA administra el proceso completo de formación catequética de una parroquia.

El eje principal del sistema no es la asistencia ni el alumno, sino la **Inscripción**, ya que representa la participación del alumno dentro de un ciclo específico.

El modelo separa la información permanente de la persona de la información temporal correspondiente a cada ciclo.

---

# Modelo Conceptual

```text
Parroquia
    │
    ▼
Ciclo
    │
    ▼
Libro
    │
    ▼
Grupo
    │
    ▼
Inscripción
   ├──────────────┐
   │              │
   ▼              ▼
Alumno         Tutor
   │
   ├──────────────┐
   │              │
   ▼              ▼
Sacramentos   Código QR
                     │
                     ▼
               Credencial
                     │
                     ▼
                  Evento
                     │
                     ▼                     
                Sesión de Evento
                     │
                     ▼
                 Asistencia
                     │
          ┌──────────┴──────────┐
          ▼                     ▼
     Evaluación           Certificado
```

---

# Entidades del Dominio

## Parroquia

Representa la organización responsable de impartir la formación catequética.

Responsabilidades:

* Configurar ciclos.
* Administrar usuarios.
* Definir la operación de la catequesis.

En la primera versión existirá una única parroquia.

El modelo permitirá soportar múltiples parroquias en el futuro.

---

## Ciclo

Representa un periodo anual de formación.

Ejemplo:

2026–2027

Responsabilidades:

* Agrupar toda la operación anual.
* Definir qué grupos pertenecen al ciclo.
* Mantener la información histórica.

Características:

* Solo un ciclo activo.
* Los ciclos finalizados permanecen archivados.

---

## Libro

Representa el nivel de formación catequética.

Cada Libro corresponde a un año de preparación.

Ejemplos:

* Libro 1
* Libro 2
* Libro 3

Un Libro puede existir durante muchos ciclos.

---

## Grupo

Representa un conjunto de alumnos que cursan el mismo Libro durante un Ciclo.

Cada Grupo posee:

* Nombre
* Horario
* Salón
* Catequista
* Auxiliar

El Grupo únicamente existe dentro de un Ciclo determinado.

---

## Catequista

Responsable principal de impartir la formación a un Grupo.

Características:

* Atiende un único Grupo activo.
* Conserva historial de participación.
* Puede generar asistencias y evaluaciones.

---

## Auxiliar

Apoya al Catequista durante el desarrollo del curso.

Funciones principales:

* Registrar asistencias.
* Apoyar actividades del grupo.

---

## Alumno

Representa a la persona.

No depende del ciclo.

No depende del grupo.

No depende del libro.

Su información permanece durante toda su estancia en la parroquia.

Conserva:

* Datos personales.
* Historial.
* Sacramentos.
* Código QR permanente.

---

## Tutor

Representa al responsable del Alumno durante un Ciclo.

El Tutor pertenece a la Inscripción y no directamente al Alumno.

Esto permite registrar distintos responsables en ciclos diferentes sin perder el historial.

---

## Inscripción

La Inscripción representa la participación del Alumno en un Ciclo.

Es la entidad central del dominio.

Toda la operación anual depende de ella.

Incluye:

* Alumno
* Ciclo
* Libro
* Grupo
* Tutor
* Estado
* Credencial
* Evaluación
* Certificado

La Inscripción conserva el historial académico del Alumno durante un ciclo específico.

---

## Código QR

Identificador permanente del Alumno.

Características:

* Nunca cambia.
* No depende del ciclo.
* No depende del grupo.
* No depende de la credencial.

Su función consiste únicamente en identificar al Alumno.

Una vez identificado, el sistema localiza automáticamente la Inscripción activa.

---

## Credencial

Documento generado para una Inscripción.

Cada ciclo genera una nueva credencial.

Contiene:

* Fotografía
* Nombre
* Libro
* Grupo
* Código QR

Aunque la credencial cambia cada ciclo, el Código QR permanece igual.

---

## Evento

Representa cualquier actividad que puede requerir control de asistencia.

Tipos previstos:

* Clase
* Misa
* Retiro
* Plática
* Confesión
* Actividad Especial

El uso de una única entidad para todos los eventos simplifica la operación y permite ampliar el sistema sin modificar el modelo principal.

---

## Sesión de Evento

Responsabilidad

Representar la realización concreta de un Evento.

Atributos conceptuales

Fecha
Hora de inicio
Hora de fin
Estado
Observaciones

Relaciones

Pertenece a un Evento.
Tiene muchas Asistencias.

---

## Asistencia

Representa la participación de una Inscripción en un Evento.

Cada asistencia conserva:

* Fecha
* Hora
* Usuario que registró
* Método de captura
* Estado
* Justificación (cuando exista)

---

## Evaluación

Representa el resultado académico del Alumno durante una Inscripción.

Puede considerar:

* Examen
* Porcentaje de asistencia
* Resultado final

---

## Certificado

Documento que acredita la conclusión satisfactoria del Libro.

Su emisión depende del cumplimiento de las reglas de negocio establecidas por la parroquia.

---

## Sacramento

Representa los sacramentos registrados del Alumno.

Inicialmente:

* Bautismo
* Primera Comunión
* Confirmación

Cada registro podrá almacenar:

* Fecha
* Parroquia

---

# Relaciones Conceptuales

* Una Parroquia administra muchos Ciclos.
* Un Ciclo contiene muchos Grupos.
* Un Libro puede existir en muchos Ciclos.
* Un Grupo pertenece a un Libro y a un Ciclo.
* Un Grupo tiene un Catequista y un Auxiliar.
* Un Alumno puede tener muchas Inscripciones a lo largo del tiempo.
* Una Inscripción pertenece a un único Alumno.
* Una Inscripción pertenece a un único Grupo.
* Una Inscripción tiene un único Tutor.
* Una Inscripción genera una Credencial.
* Un Alumno posee un único Código QR permanente.
* Una Inscripción participa en muchos Eventos mediante registros de Asistencia.
* Una Inscripción puede generar una Evaluación.
* Una Inscripción puede generar un Certificado.

---

# Principios del Modelo

## Separación entre Persona y Operación

Los datos permanentes pertenecen al Alumno.

Los datos anuales pertenecen a la Inscripción.

---

## Historial Completo

Toda la información histórica deberá conservarse.

El sistema nunca sobrescribirá la historia de un Alumno.

---

## Identidad Permanente

La identidad del Alumno permanecerá constante durante toda su formación.

El Código QR será el identificador operativo utilizado para registrar asistencias.

---

## Modelo Basado en Eventos

Toda asistencia pertenece a un Evento.

Esto permite incorporar nuevas actividades sin modificar el modelo principal.

---

## Escalabilidad

El modelo está preparado para evolucionar hacia:

* Múltiples parroquias.
* Nuevos sacramentos.
* Nuevos tipos de eventos.
* Aplicaciones móviles.
* Portal para padres de familia.
* Integraciones con otros sistemas.

---

# Decisiones de Arquitectura Derivadas

Durante el análisis funcional se identificaron las siguientes decisiones fundamentales:

1. La entidad central del dominio es la **Inscripción**, no el Alumno.
2. El Código QR identifica únicamente al Alumno y nunca cambia.
3. Las asistencias se registran sobre Eventos, no sobre clases o misas específicas.
4. El historial nunca será eliminado.
5. La información anual se separa de la información permanente del Alumno.
6. El modelo prioriza la trazabilidad y la conservación histórica sobre la modificación de registros.

---

# Resultado Esperado

Este modelo constituye la base conceptual para:

* El diseño del modelo relacional.
* La definición de la base de datos.
* Las APIs del backend.
* La construcción del frontend.
* Las reglas de negocio.
* Las futuras especificaciones técnicas (SPEC).

Cualquier modificación estructural del sistema deberá evaluarse primero contra este documento antes de implementarse en el software.
