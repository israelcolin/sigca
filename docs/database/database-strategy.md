# Database Strategy

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Definir la estrategia oficial para el diseño, evolución y mantenimiento de la base de datos de SIGCA.

Este documento establece las decisiones arquitectónicas relacionadas con persistencia, auditoría, versionado, convenciones y crecimiento del sistema.

Toda implementación deberá respetar estas directrices.

---

# Principios

La base de datos deberá diseñarse bajo los siguientes principios:

* Simplicidad.
* Integridad.
* Escalabilidad.
* Historial completo.
* Auditoría.
* Bajo acoplamiento.
* Evolución controlada.

---

# Motor de Base de Datos

Proveedor:

Supabase

Motor:

PostgreSQL

Toda la persistencia del sistema utilizará PostgreSQL administrado por Supabase.

---

# Identificadores

Todas las entidades principales utilizarán UUID como llave primaria.

Ejemplo:

id

UUID

Beneficios:

* Evita colisiones.
* Facilita integraciones.
* Permite futuras sincronizaciones.
* Incrementa la seguridad frente a identificadores secuenciales.

---

# Auditoría

Todas las tablas principales deberán incluir:

created_at

created_by

updated_at

updated_by

Opcionalmente:

deleted_at

deleted_by

cuando la entidad permita desactivación lógica.

---

# Soft Delete

Como regla general:

No se eliminarán registros históricos.

Las entidades utilizarán estados.

Ejemplo:

Activo

Archivado

Cancelado

Suspendido

En lugar de eliminar información.

---

# Versionado

La estructura de la base de datos será administrada mediante migraciones.

No deberán realizarse modificaciones permanentes directamente desde la interfaz de Supabase.

Toda modificación estructural deberá estar versionada dentro del repositorio.

Ruta:

database/

migrations/

---

# Convenciones

Las tablas utilizarán nombres en singular.

Ejemplo:

alumno

grupo

ciclo

inscripcion

No:

alumnos

grupos

---

Los nombres utilizarán:

snake_case

Ejemplos:

fecha_nacimiento

codigo_qr

created_at

---

Las llaves foráneas seguirán el formato:

<tabla>_id

Ejemplos:

alumno_id

grupo_id

ciclo_id

---

# Estados

Siempre que sea posible se utilizarán catálogos en lugar de valores libres.

Ejemplo:

estado_inscripcion

estado_evento

estado_asistencia

---

# Fechas

Toda fecha será almacenada en UTC.

La presentación al usuario utilizará la zona horaria configurada por la aplicación.

---

# Fotografías

Las imágenes no se almacenarán dentro de PostgreSQL.

Se utilizará Supabase Storage.

La base de datos únicamente almacenará la referencia al archivo.

---

# Código QR

El contenido del QR no almacenará información sensible.

Únicamente contendrá un identificador permanente del Alumno.

Toda la información adicional será recuperada desde la base de datos.

---

# Historial

La información histórica nunca deberá perderse.

Cuando un Alumno cambie de:

Grupo

Tutor

Libro

Ciclo

se generará un nuevo registro relacionado y nunca se sobrescribirá la información anterior.

---

# Integridad Referencial

Todas las relaciones utilizarán claves foráneas.

No se permitirán registros huérfanos.

Las restricciones deberán implementarse desde la base de datos y no únicamente desde el backend.

---

# Índices

Se crearán índices para:

UUID

Código QR

CURP

Ciclo

Grupo

Evento

Asistencias

Únicamente cuando exista una justificación funcional.

---

# Catálogos

Los valores reutilizables deberán almacenarse como catálogos.

Ejemplos:

Sexo

Tipo de Evento

Estado de Asistencia

Parentesco

Rol

Tipo de Sacramento

---

# Seguridad

Las políticas de acceso serán administradas mediante Row Level Security (RLS) de Supabase.

Las reglas de autorización del negocio se implementarán en el backend y se complementarán con RLS para proteger el acceso directo a la base de datos.

---

# Rendimiento

Se priorizará la claridad del modelo sobre la optimización prematura.

Las optimizaciones deberán basarse en métricas reales de uso.

---

# Escalabilidad

La estrategia permitirá evolucionar hacia:

* Múltiples parroquias.
* Múltiples sedes.
* Más sacramentos.
* Más tipos de eventos.
* Portal para padres.
* Aplicación móvil.
* Integraciones externas.

Sin rediseñar el modelo principal.

---

# Decisiones Arquitectónicas

DA-001

Todas las entidades utilizarán UUID.

DA-002

El historial nunca se elimina.

DA-003

La información permanente se separa de la información anual.

DA-004

Las relaciones se protegerán mediante claves foráneas.

DA-005

Las modificaciones estructurales se realizarán únicamente mediante migraciones versionadas.

DA-006

El almacenamiento de archivos utilizará Supabase Storage.

DA-007

La seguridad utilizará Row Level Security.

---

# Resultado Esperado

La base de datos de SIGCA deberá ser consistente, auditable, escalable y preparada para soportar la evolución del sistema durante muchos años sin requerir rediseños importantes.
