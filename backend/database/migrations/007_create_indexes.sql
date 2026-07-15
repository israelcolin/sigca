-- Migración de índices base de SIGCA
-- Implementa índices de soporte para consultas frecuentes sin modificar estructuras existentes.

BEGIN;

CREATE INDEX IF NOT EXISTS idx_grupo_ciclo_id
    ON grupo (ciclo_id);

CREATE INDEX IF NOT EXISTS idx_grupo_libro_id
    ON grupo (libro_id);

CREATE INDEX IF NOT EXISTS idx_ciclo_activo
    ON ciclo (activo);

CREATE INDEX IF NOT EXISTS idx_alumno_tutor_id
    ON alumno (tutor_id);

CREATE INDEX IF NOT EXISTS idx_alumno_curp
    ON alumno (curp);

CREATE INDEX IF NOT EXISTS idx_inscripcion_grupo_id
    ON inscripcion (grupo_id);

CREATE INDEX IF NOT EXISTS idx_inscripcion_alumno_id
    ON inscripcion (alumno_id);

CREATE INDEX IF NOT EXISTS idx_inscripcion_ciclo_id
    ON inscripcion (ciclo_id);

CREATE INDEX IF NOT EXISTS idx_codigo_qr_codigo
    ON codigo_qr (codigo);

CREATE INDEX IF NOT EXISTS idx_credencial_alumno_id
    ON credencial (alumno_id);

CREATE INDEX IF NOT EXISTS idx_sacramento_alumno_id
    ON sacramento (alumno_id);

CREATE INDEX IF NOT EXISTS idx_evento_grupo_id
    ON evento (grupo_id);

CREATE INDEX IF NOT EXISTS idx_evento_tipo_evento_id
    ON evento (tipo_evento_id);

CREATE INDEX IF NOT EXISTS idx_sesion_evento_evento_id
    ON sesion_evento (evento_id);

CREATE INDEX IF NOT EXISTS idx_sesion_evento_fecha
    ON sesion_evento (fecha);

CREATE INDEX IF NOT EXISTS idx_asistencia_alumno_id
    ON asistencia (alumno_id);

CREATE INDEX IF NOT EXISTS idx_asistencia_sesion_evento_id
    ON asistencia (sesion_evento_id);

CREATE INDEX IF NOT EXISTS idx_asistencia_registrado_por_usuario_id
    ON asistencia (registrado_por_usuario_id);

CREATE INDEX IF NOT EXISTS idx_evaluacion_grupo_id
    ON evaluacion (grupo_id);

CREATE INDEX IF NOT EXISTS idx_resultado_evaluacion_alumno_id
    ON resultado_evaluacion (alumno_id);

CREATE INDEX IF NOT EXISTS idx_resultado_evaluacion_evaluacion_id
    ON resultado_evaluacion (evaluacion_id);

CREATE INDEX IF NOT EXISTS idx_certificado_alumno_id
    ON certificado (alumno_id);

CREATE INDEX IF NOT EXISTS idx_certificado_ciclo_id
    ON certificado (ciclo_id);

COMMIT;
