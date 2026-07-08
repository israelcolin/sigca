# Naming Conventions

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética (SIGCA)

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 08/Jul/2026

---

# Objetivo

Definir las convenciones oficiales de nomenclatura utilizadas en la capa de persistencia de SIGCA.

Estas reglas aplican a:

* PostgreSQL
* Supabase
* Migraciones
* SQL
* Índices
* Constraints
* Triggers
* Vistas
* Funciones
* Storage

Toda nueva implementación deberá respetar este documento.

---

# Principios

La nomenclatura deberá ser:

* Consistente.
* Descriptiva.
* Orientada al dominio.
* Independiente de la tecnología.
* Fácil de leer.
* Fácil de buscar.

---

# Idioma

Toda la base de datos utilizará **español** como idioma oficial.

Ejemplos:

```text
alumno

inscripcion

grupo

evento
```

No:

```text
student

enrollment

event
```

La decisión responde a que el dominio del negocio y el equipo de desarrollo utilizan español como idioma principal.

---

# Tablas

## Regla

Las tablas utilizarán:

* Singular.
* Minúsculas.
* Snake Case.

Ejemplos:

```text
parroquia

ciclo

libro

grupo

catequista

auxiliar

alumno

tutor

inscripcion

evento

asistencia

credencial

certificado

sacramento

usuario
```

No utilizar:

```text
tblAlumno

Alumnos

Alumno

CAT_ALUMNO
```

---

# Columnas

Todas las columnas utilizarán:

* Snake Case.
* Minúsculas.

Ejemplos:

```text
fecha_nacimiento

codigo_qr

nombre_completo

correo_electronico

fecha_registro
```

---

# Llaves Primarias

Todas las entidades utilizarán:

```text
id
```

Tipo:

UUID

Nunca:

```text
alumno_id
```

como llave primaria.

---

# Llaves Foráneas

Formato:

```text
<tabla>_id
```

Ejemplos:

```text
alumno_id

grupo_id

ciclo_id

evento_id

usuario_id
```

---

# Tablas Relacionales

Cuando existan relaciones muchos a muchos se utilizará:

```text
<tabla1>_<tabla2>
```

Orden alfabético.

Ejemplo:

```text
usuario_rol
```

---

# Índices

Formato:

```text
idx_<tabla>_<columnas>
```

Ejemplos:

```text
idx_alumno_curp

idx_evento_fecha

idx_asistencia_evento
```

---

# Unique Constraints

Formato:

```text
uq_<tabla>_<columnas>
```

Ejemplos:

```text
uq_alumno_curp

uq_codigo_qr
```

---

# Foreign Keys

Formato:

```text
fk_<tabla>_<tabla_referenciada>
```

Ejemplos:

```text
fk_grupo_libro

fk_grupo_ciclo

fk_inscripcion_alumno
```

---

# Check Constraints

Formato:

```text
chk_<tabla>_<descripcion>
```

Ejemplos:

```text
chk_evento_fecha

chk_asistencia_estado
```

---

# Triggers

Formato:

```text
trg_<tabla>_<evento>
```

Ejemplos:

```text
trg_alumno_created

trg_inscripcion_updated
```

---

# Funciones

Formato:

```text
fn_<descripcion>
```

Ejemplos:

```text
fn_generar_qr

fn_calcular_asistencia
```

---

# Vistas

Formato:

```text
vw_<descripcion>
```

Ejemplos:

```text
vw_asistencia_grupo

vw_alumnos_activos
```

---

# Políticas RLS

Formato:

```text
rls_<tabla>_<accion>
```

Ejemplos:

```text
rls_alumno_select

rls_alumno_insert

rls_alumno_update
```

---

# Buckets de Storage

Formato:

Plural, minúsculas y snake_case.

Ejemplos:

```text
fotografias

credenciales

reportes
```

---

# Archivos

Los nombres de archivos almacenados en Supabase Storage seguirán el formato:

```text
<uuid>.<extension>
```

Ejemplo:

```text
8d0d9d7b-61f7-44e0-a9d8-8c6d3d0d4b2f.jpg
```

No se utilizarán nombres originales enviados por el usuario.

---

# Variables de Entorno

Formato:

Mayúsculas con guion bajo.

Ejemplos:

```text
SUPABASE_URL

SUPABASE_ANON_KEY

APP_NAME

APP_VERSION
```

---

# Migraciones

Formato:

```text
YYYYMMDDHHMM_descripcion.sql
```

Ejemplo:

```text
202607081030_create_alumno.sql
```

---

# Seeds

Formato:

```text
seed_<descripcion>.sql
```

Ejemplo:

```text
seed_roles.sql

seed_libros.sql
```

---

# Catálogos

Todos los catálogos seguirán la misma estructura:

```text
cat_<nombre>
```

Ejemplos:

```text
cat_roles

cat_estados_inscripcion

cat_tipos_evento

cat_parentescos

cat_sacramentos
```

---

# Convenciones de Auditoría

Todas las entidades principales deberán incluir:

```text
created_at

created_by

updated_at

updated_by
```

Cuando aplique Soft Delete:

```text
deleted_at

deleted_by
```

---

# Abreviaturas Permitidas

Solo se permiten las siguientes abreviaturas oficiales:

| Abreviatura | Significado        |
| ----------- | ------------------ |
| id          | Identificador      |
| qr          | Código QR          |
| fk          | Foreign Key        |
| pk          | Primary Key        |
| idx         | Índice             |
| uq          | Unique Constraint  |
| chk         | Check Constraint   |
| trg         | Trigger            |
| fn          | Función            |
| vw          | Vista              |
| rls         | Row Level Security |
| cat         | Catálogo           |

No deberán introducirse nuevas abreviaturas sin documentarlas previamente.

---

# Ejemplo Integrado

Entidad:

```text
alumno
```

Columnas:

```text
id

nombre_completo

fecha_nacimiento

curp

codigo_qr

created_at

updated_at
```

Índice:

```text
idx_alumno_curp
```

Constraint:

```text
uq_alumno_curp
```

Foreign Key:

```text
grupo_id
```

Política:

```text
rls_alumno_select
```

---

# Cumplimiento

Todas las nuevas tablas, columnas, funciones, migraciones y políticas deberán cumplir obligatoriamente estas convenciones.

Cualquier excepción deberá documentarse mediante una DEC o una ADR antes de implementarse.

---

# Resultado Esperado

La capa de persistencia de SIGCA mantendrá una nomenclatura uniforme, consistente y preparada para crecer sin ambigüedades, facilitando el mantenimiento, las búsquedas y la incorporación de nuevos desarrolladores al proyecto.
