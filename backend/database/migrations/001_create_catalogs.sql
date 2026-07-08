-- Migración de catálogos base de SIGCA
-- Implementa los catálogos de dominio sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS cat_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_roles_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_roles_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_roles IS 'Catálogo de roles del sistema';
COMMENT ON COLUMN cat_roles.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_roles.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_roles.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_roles.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_roles.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_roles.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_roles.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_roles.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_tipos_evento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_tipos_evento_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_tipos_evento_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_tipos_evento IS 'Catálogo de tipos de evento';
COMMENT ON COLUMN cat_tipos_evento.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_tipos_evento.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_tipos_evento.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_tipos_evento.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_tipos_evento.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_tipos_evento.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_tipos_evento.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_tipos_evento.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_estados_evento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_estados_evento_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_estados_evento_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_estados_evento IS 'Catálogo de estados de evento';
COMMENT ON COLUMN cat_estados_evento.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_estados_evento.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_estados_evento.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_estados_evento.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_estados_evento.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_estados_evento.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_estados_evento.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_estados_evento.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_estados_sesion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_estados_sesion_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_estados_sesion_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_estados_sesion IS 'Catálogo de estados de sesión';
COMMENT ON COLUMN cat_estados_sesion.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_estados_sesion.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_estados_sesion.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_estados_sesion.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_estados_sesion.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_estados_sesion.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_estados_sesion.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_estados_sesion.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_estados_asistencia (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_estados_asistencia_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_estados_asistencia_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_estados_asistencia IS 'Catálogo de estados de asistencia';
COMMENT ON COLUMN cat_estados_asistencia.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_estados_asistencia.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_estados_asistencia.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_estados_asistencia.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_estados_asistencia.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_estados_asistencia.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_estados_asistencia.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_estados_asistencia.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_estados_inscripcion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_estados_inscripcion_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_estados_inscripcion_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_estados_inscripcion IS 'Catálogo de estados de inscripción';
COMMENT ON COLUMN cat_estados_inscripcion.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_estados_inscripcion.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_estados_inscripcion.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_estados_inscripcion.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_estados_inscripcion.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_estados_inscripcion.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_estados_inscripcion.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_estados_inscripcion.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_parentescos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_parentescos_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_parentescos_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_parentescos IS 'Catálogo de parentescos';
COMMENT ON COLUMN cat_parentescos.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_parentescos.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_parentescos.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_parentescos.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_parentescos.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_parentescos.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_parentescos.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_parentescos.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_sacramentos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_sacramentos_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_sacramentos_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_sacramentos IS 'Catálogo de sacramentos';
COMMENT ON COLUMN cat_sacramentos.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_sacramentos.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_sacramentos.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_sacramentos.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_sacramentos.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_sacramentos.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_sacramentos.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_sacramentos.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS cat_sexos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    orden INTEGER NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT cat_sexos_codigo_no_vacio CHECK (length(trim(codigo)) > 0),
    CONSTRAINT cat_sexos_nombre_no_vacio CHECK (length(trim(nombre)) > 0)
);

COMMENT ON TABLE cat_sexos IS 'Catálogo de sexos';
COMMENT ON COLUMN cat_sexos.id IS 'Identificador único del catálogo';
COMMENT ON COLUMN cat_sexos.codigo IS 'Código interno del catálogo';
COMMENT ON COLUMN cat_sexos.nombre IS 'Nombre visible del catálogo';
COMMENT ON COLUMN cat_sexos.descripcion IS 'Descripción del valor del catálogo';
COMMENT ON COLUMN cat_sexos.orden IS 'Orden de presentación del catálogo';
COMMENT ON COLUMN cat_sexos.activo IS 'Indica si el valor del catálogo está activo';
COMMENT ON COLUMN cat_sexos.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN cat_sexos.updated_at IS 'Fecha de última modificación del registro';

COMMIT;
