-- Migración de eventos base de SIGCA
-- Implementa el dominio de eventos sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS evento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    grupo_id UUID NULL,
    tipo_evento_id UUID NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (grupo_id IS NOT NULL OR tipo_evento_id IS NOT NULL),
    CONSTRAINT evento_grupo_id_fk FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT evento_tipo_evento_id_fk FOREIGN KEY (tipo_evento_id) REFERENCES cat_tipos_evento (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

COMMENT ON TABLE evento IS 'Eventos de la comunidad catequética';
COMMENT ON COLUMN evento.id IS 'Identificador único del evento';
COMMENT ON COLUMN evento.grupo_id IS 'Referencia al grupo asociado al evento; nulo para eventos generales';
COMMENT ON COLUMN evento.tipo_evento_id IS 'Referencia al tipo de evento';
COMMENT ON COLUMN evento.nombre IS 'Nombre del evento';
COMMENT ON COLUMN evento.descripcion IS 'Descripción del evento';
COMMENT ON COLUMN evento.activo IS 'Indica si el evento está activo';
COMMENT ON COLUMN evento.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN evento.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS sesion_evento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    evento_id UUID NOT NULL,
    estado_id UUID NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT sesion_evento_evento_id_fk FOREIGN KEY (evento_id) REFERENCES evento (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT sesion_evento_estado_id_fk FOREIGN KEY (estado_id) REFERENCES cat_estados_sesion (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT sesion_evento_hora_check CHECK (hora_inicio < hora_fin)
);

COMMENT ON TABLE sesion_evento IS 'Sesiones asociadas a un evento';
COMMENT ON COLUMN sesion_evento.id IS 'Identificador único de la sesión del evento';
COMMENT ON COLUMN sesion_evento.evento_id IS 'Referencia al evento al que pertenece la sesión';
COMMENT ON COLUMN sesion_evento.estado_id IS 'Referencia al estado de la sesión';
COMMENT ON COLUMN sesion_evento.fecha IS 'Fecha de la sesión';
COMMENT ON COLUMN sesion_evento.hora_inicio IS 'Hora de inicio de la sesión';
COMMENT ON COLUMN sesion_evento.hora_fin IS 'Hora de fin de la sesión';
COMMENT ON COLUMN sesion_evento.observaciones IS 'Observaciones adicionales de la sesión';
COMMENT ON COLUMN sesion_evento.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN sesion_evento.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS asistencia (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sesion_evento_id UUID NOT NULL,
    alumno_id UUID NOT NULL,
    estado_id UUID NOT NULL,
    registrado_por_usuario_id UUID NOT NULL,
    fecha_registro TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    justificacion TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT asistencia_sesion_evento_id_fk FOREIGN KEY (sesion_evento_id) REFERENCES sesion_evento (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT asistencia_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT asistencia_estado_id_fk FOREIGN KEY (estado_id) REFERENCES cat_estados_asistencia (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT asistencia_registrado_por_usuario_id_fk FOREIGN KEY (registrado_por_usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT asistencia_unica UNIQUE (sesion_evento_id, alumno_id)
);

COMMENT ON TABLE asistencia IS 'Asistencias registradas por sesión';
COMMENT ON COLUMN asistencia.id IS 'Identificador único de la asistencia';
COMMENT ON COLUMN asistencia.sesion_evento_id IS 'Referencia a la sesión del evento';
COMMENT ON COLUMN asistencia.alumno_id IS 'Referencia al alumno asistido';
COMMENT ON COLUMN asistencia.estado_id IS 'Referencia al estado de la asistencia';
COMMENT ON COLUMN asistencia.registrado_por_usuario_id IS 'Referencia al usuario que registró la asistencia';
COMMENT ON COLUMN asistencia.fecha_registro IS 'Fecha y hora en que se registró la asistencia';
COMMENT ON COLUMN asistencia.justificacion IS 'Justificación de la asistencia o ausencia';
COMMENT ON COLUMN asistencia.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN asistencia.updated_at IS 'Fecha de última modificación del registro';

COMMIT;
