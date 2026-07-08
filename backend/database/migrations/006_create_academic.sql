-- Migración de académico base de SIGCA
-- Implementa el dominio académico sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS evaluacion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    grupo_id UUID NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    fecha DATE NOT NULL,
    ponderacion NUMERIC(5,2) NULL,
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT evaluacion_grupo_id_fk FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT evaluacion_ponderacion_check CHECK (ponderacion IS NULL OR (ponderacion >= 0 AND ponderacion <= 100))
);

COMMENT ON TABLE evaluacion IS 'Evaluaciones asociadas a grupos';
COMMENT ON COLUMN evaluacion.id IS 'Identificador único de la evaluación';
COMMENT ON COLUMN evaluacion.grupo_id IS 'Referencia al grupo al que pertenece la evaluación';
COMMENT ON COLUMN evaluacion.nombre IS 'Nombre de la evaluación';
COMMENT ON COLUMN evaluacion.descripcion IS 'Descripción de la evaluación';
COMMENT ON COLUMN evaluacion.fecha IS 'Fecha en que se aplica la evaluación';
COMMENT ON COLUMN evaluacion.ponderacion IS 'Ponderación de la evaluación';
COMMENT ON COLUMN evaluacion.activa IS 'Indica si la evaluación está activa';
COMMENT ON COLUMN evaluacion.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN evaluacion.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS resultado_evaluacion (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    evaluacion_id UUID NOT NULL,
    alumno_id UUID NOT NULL,
    calificacion NUMERIC(5,2) NULL,
    aprobado BOOLEAN NOT NULL DEFAULT FALSE,
    observaciones TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT resultado_evaluacion_evaluacion_id_fk FOREIGN KEY (evaluacion_id) REFERENCES evaluacion (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT resultado_evaluacion_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT resultado_evaluacion_unica UNIQUE (evaluacion_id, alumno_id),
    CONSTRAINT resultado_evaluacion_calificacion_check CHECK (calificacion IS NULL OR (calificacion >= 0 AND calificacion <= 100))
);

COMMENT ON TABLE resultado_evaluacion IS 'Resultados de evaluaciones por alumno';
COMMENT ON COLUMN resultado_evaluacion.id IS 'Identificador único del resultado de evaluación';
COMMENT ON COLUMN resultado_evaluacion.evaluacion_id IS 'Referencia a la evaluación';
COMMENT ON COLUMN resultado_evaluacion.alumno_id IS 'Referencia al alumno';
COMMENT ON COLUMN resultado_evaluacion.calificacion IS 'Calificación obtenida por el alumno';
COMMENT ON COLUMN resultado_evaluacion.aprobado IS 'Indica si el alumno aprobó la evaluación';
COMMENT ON COLUMN resultado_evaluacion.observaciones IS 'Observaciones adicionales del resultado';
COMMENT ON COLUMN resultado_evaluacion.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN resultado_evaluacion.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS certificado (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    alumno_id UUID NOT NULL,
    ciclo_id UUID NOT NULL,
    libro_id UUID NOT NULL,
    fecha_emision DATE NOT NULL,
    porcentaje_asistencia NUMERIC(5,2) NOT NULL,
    aprobado BOOLEAN NOT NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT certificado_alumno_id_fk FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT certificado_ciclo_id_fk FOREIGN KEY (ciclo_id) REFERENCES ciclo (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT certificado_libro_id_fk FOREIGN KEY (libro_id) REFERENCES libro (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT certificado_unica UNIQUE (alumno_id, ciclo_id, libro_id),
    CONSTRAINT certificado_porcentaje_asistencia_check CHECK (porcentaje_asistencia >= 0 AND porcentaje_asistencia <= 100)
);

COMMENT ON TABLE certificado IS 'Certificados emitidos por alumno, ciclo y libro';
COMMENT ON COLUMN certificado.id IS 'Identificador único del certificado';
COMMENT ON COLUMN certificado.alumno_id IS 'Referencia al alumno';
COMMENT ON COLUMN certificado.ciclo_id IS 'Referencia al ciclo';
COMMENT ON COLUMN certificado.libro_id IS 'Referencia al libro';
COMMENT ON COLUMN certificado.fecha_emision IS 'Fecha de emisión del certificado';
COMMENT ON COLUMN certificado.porcentaje_asistencia IS 'Porcentaje de asistencia del alumno';
COMMENT ON COLUMN certificado.aprobado IS 'Indica si el alumno aprobó';
COMMENT ON COLUMN certificado.observaciones IS 'Observaciones adicionales del certificado';
COMMENT ON COLUMN certificado.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN certificado.updated_at IS 'Fecha de última modificación del registro';

COMMIT;
