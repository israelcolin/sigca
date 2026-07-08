-- Migración de catequesis base de SIGCA
-- Implementa el dominio de catequesis sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS tutor (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NULL,
    telefono VARCHAR(30) NULL,
    celular VARCHAR(30) NOT NULL,
    correo VARCHAR(255) NULL,
    parentesco_id UUID NOT NULL,
    contacto_adicional_nombre VARCHAR(200) NULL,
    contacto_adicional_telefono VARCHAR(30) NULL,
    contacto_adicional_parentesco_id UUID NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT tutor_parentesco_id_fk FOREIGN KEY (parentesco_id) REFERENCES cat_parentescos (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT tutor_contacto_adicional_parentesco_id_fk FOREIGN KEY (contacto_adicional_parentesco_id) REFERENCES cat_parentescos (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE tutor IS 'Tutores de los alumnos';
COMMENT ON COLUMN tutor.id IS 'Identificador único del tutor';
COMMENT ON COLUMN tutor.nombre IS 'Nombre del tutor';
COMMENT ON COLUMN tutor.apellido_paterno IS 'Apellido paterno del tutor';
COMMENT ON COLUMN tutor.apellido_materno IS 'Apellido materno del tutor';
COMMENT ON COLUMN tutor.telefono IS 'Teléfono fijo del tutor';
COMMENT ON COLUMN tutor.celular IS 'Teléfono celular del tutor';
COMMENT ON COLUMN tutor.correo IS 'Correo electrónico del tutor';
COMMENT ON COLUMN tutor.parentesco_id IS 'Parentesco del tutor con el alumno';
COMMENT ON COLUMN tutor.contacto_adicional_nombre IS 'Nombre del contacto adicional';
COMMENT ON COLUMN tutor.contacto_adicional_telefono IS 'Teléfono del contacto adicional';
COMMENT ON COLUMN tutor.contacto_adicional_parentesco_id IS 'Parentesco del contacto adicional con el alumno';
COMMENT ON COLUMN tutor.activo IS 'Indica si el tutor está activo';
COMMENT ON COLUMN tutor.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN tutor.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS alumno (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    curp VARCHAR(18) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo_id UUID NOT NULL,
    fotografia_url TEXT NULL,
    tutor_id UUID NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT alumno_tutor_id_fk FOREIGN KEY (tutor_id) REFERENCES tutor (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT alumno_sexo_id_fk FOREIGN KEY (sexo_id) REFERENCES cat_sexos (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE alumno IS 'Alumnos de catequesis';
COMMENT ON COLUMN alumno.id IS 'Identificador único del alumno';
COMMENT ON COLUMN alumno.curp IS 'CURP del alumno';
COMMENT ON COLUMN alumno.nombre IS 'Nombre del alumno';
COMMENT ON COLUMN alumno.apellido_paterno IS 'Apellido paterno del alumno';
COMMENT ON COLUMN alumno.apellido_materno IS 'Apellido materno del alumno';
COMMENT ON COLUMN alumno.fecha_nacimiento IS 'Fecha de nacimiento del alumno';
COMMENT ON COLUMN alumno.sexo_id IS 'Referencia al sexo del alumno';
COMMENT ON COLUMN alumno.fotografia_url IS 'URL de la fotografía del alumno';
COMMENT ON COLUMN alumno.tutor_id IS 'Referencia al tutor principal del alumno';
COMMENT ON COLUMN alumno.activo IS 'Indica si el alumno está activo';
COMMENT ON COLUMN alumno.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN alumno.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS inscripcion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    alumno_id UUID NOT NULL,
    grupo_id UUID NOT NULL,
    ciclo_id UUID NOT NULL,
    estado_id UUID NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(alumno_id, grupo_id),
    UNIQUE(alumno_id, ciclo_id),
    CONSTRAINT inscripcion_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT inscripcion_grupo_id_fk FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT inscripcion_estado_id_fk FOREIGN KEY (estado_id) REFERENCES cat_estados_inscripcion (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT inscripcion_unica UNIQUE (alumno_id, grupo_id)
);

COMMENT ON TABLE inscripcion IS 'Inscripciones de alumnos a grupos';
COMMENT ON COLUMN inscripcion.id IS 'Identificador único de la inscripción';
COMMENT ON COLUMN inscripcion.alumno_id IS 'Referencia al alumno inscrito';
COMMENT ON COLUMN inscripcion.grupo_id IS 'Referencia al grupo al que se inscribe';
COMMENT ON COLUMN inscripcion.estado_id IS 'Referencia al estado de la inscripción';
COMMENT ON COLUMN inscripcion.fecha_inscripcion IS 'Fecha en que se realizó la inscripción';
COMMENT ON COLUMN inscripcion.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN inscripcion.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS codigo_qr (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    alumno_id UUID NOT NULL UNIQUE,
    codigo TEXT NOT NULL UNIQUE,
    vigente BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT codigo_qr_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE codigo_qr IS 'Códigos QR de los alumnos';
COMMENT ON COLUMN codigo_qr.id IS 'Identificador único del código QR';
COMMENT ON COLUMN codigo_qr.alumno_id IS 'Referencia al alumno asociado al código QR';
COMMENT ON COLUMN codigo_qr.codigo IS 'Valor del código QR';
COMMENT ON COLUMN codigo_qr.vigente IS 'Indica si el código QR sigue vigente';
COMMENT ON COLUMN codigo_qr.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN codigo_qr.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS credencial (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    alumno_id UUID NOT NULL,
    ciclo_id UUID NOT NULL,
    fecha_emision DATE NOT NULL,
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(alumno_id, ciclo_id),
    CONSTRAINT credencial_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT credencial_ciclo_id_fk FOREIGN KEY (ciclo_id) REFERENCES ciclo (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE credencial IS 'Credenciales emitidas por ciclo';
COMMENT ON COLUMN credencial.id IS 'Identificador único de la credencial';
COMMENT ON COLUMN credencial.alumno_id IS 'Referencia al alumno';
COMMENT ON COLUMN credencial.ciclo_id IS 'Referencia al ciclo para el que se emitió la credencial';
COMMENT ON COLUMN credencial.fecha_emision IS 'Fecha de emisión de la credencial';
COMMENT ON COLUMN credencial.activa IS 'Indica si la credencial está activa';
COMMENT ON COLUMN credencial.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN credencial.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS sacramento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    alumno_id UUID NOT NULL,
    tipo_sacramento_id UUID NOT NULL,
    parroquia VARCHAR(200) NULL,
    fecha DATE NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(alumno_id, tipo_sacramento_id),
    CONSTRAINT sacramento_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT sacramento_tipo_sacramento_id_fk FOREIGN KEY (tipo_sacramento_id) REFERENCES cat_sacramentos (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE sacramento IS 'Sacramentos registrados para los alumnos';
COMMENT ON COLUMN sacramento.id IS 'Identificador único del sacramento';
COMMENT ON COLUMN sacramento.alumno_id IS 'Referencia al alumno';
COMMENT ON COLUMN sacramento.tipo_sacramento_id IS 'Referencia al tipo de sacramento';
COMMENT ON COLUMN sacramento.parroquia IS 'Parroquia donde se realizó el sacramento';
COMMENT ON COLUMN sacramento.fecha IS 'Fecha del sacramento';
COMMENT ON COLUMN sacramento.observaciones IS 'Observaciones adicionales del sacramento';
COMMENT ON COLUMN sacramento.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN sacramento.updated_at IS 'Fecha de última modificación del registro';

COMMIT;