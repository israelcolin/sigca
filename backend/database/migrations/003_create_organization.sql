-- Migración de organización base de SIGCA
-- Implementa el dominio de organización sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS parroquia (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(150) NOT NULL,
    diocesis VARCHAR(150) NULL,
    direccion TEXT NULL,
    telefono VARCHAR(30) NULL,
    correo VARCHAR(255) NULL,
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE parroquia IS 'Parroquias gestionadas por SIGCA';
COMMENT ON COLUMN parroquia.id IS 'Identificador único de la parroquia';
COMMENT ON COLUMN parroquia.nombre IS 'Nombre de la parroquia';
COMMENT ON COLUMN parroquia.diocesis IS 'Diócesis a la que pertenece la parroquia';
COMMENT ON COLUMN parroquia.direccion IS 'Dirección física de la parroquia';
COMMENT ON COLUMN parroquia.telefono IS 'Teléfono de contacto de la parroquia';
COMMENT ON COLUMN parroquia.correo IS 'Correo electrónico de contacto de la parroquia';
COMMENT ON COLUMN parroquia.activa IS 'Indica si la parroquia está activa';
COMMENT ON COLUMN parroquia.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN parroquia.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS ciclo (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parroquia_id UUID NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (fecha_inicio <= fecha_fin),
    CONSTRAINT ciclo_parroquia_id_fk FOREIGN KEY (parroquia_id) REFERENCES parroquia (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE ciclo IS 'Ciclos catequéticos de una parroquia';
COMMENT ON COLUMN ciclo.id IS 'Identificador único del ciclo';
COMMENT ON COLUMN ciclo.parroquia_id IS 'Referencia a la parroquia propietaria del ciclo';
COMMENT ON COLUMN ciclo.nombre IS 'Nombre del ciclo';
COMMENT ON COLUMN ciclo.fecha_inicio IS 'Fecha de inicio del ciclo';
COMMENT ON COLUMN ciclo.fecha_fin IS 'Fecha de fin del ciclo';
COMMENT ON COLUMN ciclo.activo IS 'Indica si el ciclo está activo';
COMMENT ON COLUMN ciclo.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN ciclo.updated_at IS 'Fecha de última modificación del registro';

CREATE UNIQUE INDEX IF NOT EXISTS ciclo_unico_activo_por_parroquia
    ON ciclo (parroquia_id)
    WHERE activo = TRUE;

CREATE TABLE IF NOT EXISTS libro (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    numero SMALLINT NOT NULL,
    descripcion TEXT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE libro IS 'Libros de catequesis disponibles';
COMMENT ON COLUMN libro.id IS 'Identificador único del libro';
COMMENT ON COLUMN libro.codigo IS 'Código interno del libro';
COMMENT ON COLUMN libro.nombre IS 'Nombre del libro';
COMMENT ON COLUMN libro.numero IS 'Número del libro dentro del catecismo';
COMMENT ON COLUMN libro.descripcion IS 'Descripción del libro';
COMMENT ON COLUMN libro.activo IS 'Indica si el libro está activo';
COMMENT ON COLUMN libro.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN libro.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS grupo (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ciclo_id UUID NOT NULL,
    libro_id UUID NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    dia_semana SMALLINT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    salon VARCHAR(50) NULL,
    cupo_maximo SMALLINT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    catequista_usuario_id UUID NULL,
    auxiliar_usuario_id UUID NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (dia_semana BETWEEN 1 AND 7),
    CHECK (hora_inicio < hora_fin),
    CONSTRAINT grupo_ciclo_id_fk FOREIGN KEY (ciclo_id) REFERENCES ciclo (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT grupo_libro_id_fk FOREIGN KEY (libro_id) REFERENCES libro (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT grupo_nombre_unico UNIQUE (ciclo_id, nombre)
);

COMMENT ON TABLE grupo IS 'Grupos de catequesis asociados a un ciclo';
COMMENT ON COLUMN grupo.id IS 'Identificador único del grupo';
COMMENT ON COLUMN grupo.ciclo_id IS 'Referencia al ciclo al que pertenece el grupo';
COMMENT ON COLUMN grupo.libro_id IS 'Referencia al libro usado por el grupo';
COMMENT ON COLUMN grupo.nombre IS 'Nombre del grupo';
COMMENT ON COLUMN grupo.dia_semana IS 'Día de la semana en que se imparte el grupo';
COMMENT ON COLUMN grupo.hora_inicio IS 'Hora de inicio del grupo';
COMMENT ON COLUMN grupo.hora_fin IS 'Hora de fin del grupo';
COMMENT ON COLUMN grupo.salon IS 'Salón donde se imparte el grupo';
COMMENT ON COLUMN grupo.cupo_maximo IS 'Cupo máximo de participantes del grupo';
COMMENT ON COLUMN grupo.activo IS 'Indica si el grupo está activo';
COMMENT ON COLUMN grupo.catequista_usuario_id IS 'Identificador del usuario catequista asociado al grupo';
COMMENT ON COLUMN grupo.auxiliar_usuario_id IS 'Identificador del usuario auxiliar asociado al grupo';
COMMENT ON COLUMN grupo.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN grupo.updated_at IS 'Fecha de última modificación del registro';

COMMIT;

-- Nota: la especificación indica no crear aún FKs para catequista_usuario_id y auxiliar_usuario_id; se respeta aquí.
