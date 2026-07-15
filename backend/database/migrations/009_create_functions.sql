-- Migración de funciones base de SIGCA
-- Implementa funciones reutilizables de negocio sin modificar estructuras existentes.

BEGIN;

CREATE OR REPLACE FUNCTION fn_ciclo_activo()
RETURNS UUID
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
    v_ciclo_id UUID;
BEGIN
    SELECT id
      INTO v_ciclo_id
      FROM ciclo
     WHERE activo = TRUE
     ORDER BY fecha_inicio DESC, created_at DESC
     LIMIT 1;

    RETURN v_ciclo_id;
END;
$$;

COMMENT ON FUNCTION fn_ciclo_activo() IS 'Devuelve el identificador del ciclo activo disponible en el sistema';

CREATE OR REPLACE FUNCTION fn_porcentaje_asistencia(p_alumno_id UUID, p_ciclo_id UUID)
RETURNS NUMERIC(5,2)
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
    v_total_sesiones BIGINT;
    v_asistencias BIGINT;
BEGIN
    SELECT COUNT(DISTINCT se.id)
      INTO v_total_sesiones
      FROM sesion_evento se
      JOIN evento e ON e.id = se.evento_id
      JOIN grupo g ON g.id = e.grupo_id
      JOIN inscripcion i ON i.grupo_id = g.id
     WHERE i.alumno_id = p_alumno_id
       AND g.ciclo_id = p_ciclo_id;

    SELECT COUNT(DISTINCT asis.sesion_evento_id)
      INTO v_asistencias
      FROM asistencia asis
      JOIN sesion_evento se ON se.id = asis.sesion_evento_id
      JOIN evento e ON e.id = se.evento_id
      JOIN grupo g ON g.id = e.grupo_id
      JOIN inscripcion i ON i.grupo_id = g.id
     WHERE i.alumno_id = p_alumno_id
       AND g.ciclo_id = p_ciclo_id
       AND asis.estado_id IN (
           SELECT id
           FROM cat_estados_asistencia
           WHERE codigo IN ('ASISTIO', 'JUSTIFICADA')
       );

    IF COALESCE(v_total_sesiones, 0) = 0 THEN
        RETURN 0;
    END IF;

    RETURN ROUND((v_asistencias * 100.0) / v_total_sesiones, 2);
END;
$$;

COMMENT ON FUNCTION fn_porcentaje_asistencia(UUID, UUID) IS 'Calcula el porcentaje de asistencia de un alumno en un ciclo';

CREATE OR REPLACE FUNCTION fn_alumno_aprobado(p_alumno_id UUID, p_ciclo_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
    v_porcentaje NUMERIC(5,2);
    v_evaluacion_aprobada BOOLEAN;
BEGIN
    v_porcentaje := fn_porcentaje_asistencia(p_alumno_id, p_ciclo_id);

    SELECT EXISTS (
        SELECT 1
        FROM resultado_evaluacion re
        JOIN evaluacion e ON e.id = re.evaluacion_id
        JOIN grupo g ON g.id = e.grupo_id
        WHERE re.alumno_id = p_alumno_id
          AND g.ciclo_id = p_ciclo_id
          AND re.aprobado = TRUE
    )
      INTO v_evaluacion_aprobada;

    RETURN v_porcentaje >= 80 AND COALESCE(v_evaluacion_aprobada, FALSE);
END;
$$;

COMMENT ON FUNCTION fn_alumno_aprobado(UUID, UUID) IS 'Determina si un alumno aprobó un ciclo considerando asistencia y evaluación';

CREATE OR REPLACE FUNCTION fn_puede_recibir_certificado(p_alumno_id UUID, p_ciclo_id UUID)
RETURNS BOOLEAN
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
    RETURN fn_alumno_aprobado(p_alumno_id, p_ciclo_id);
END;
$$;

COMMENT ON FUNCTION fn_puede_recibir_certificado(UUID, UUID) IS 'Indica si un alumno cumple con las condiciones para recibir un certificado';

CREATE OR REPLACE FUNCTION fn_qr_valido(p_codigo TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
    v_valido BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM codigo_qr
        WHERE codigo = p_codigo
          AND vigente = TRUE
    )
      INTO v_valido;

    RETURN COALESCE(v_valido, FALSE);
END;
$$;

COMMENT ON FUNCTION fn_qr_valido(TEXT) IS 'Valida si un código QR existe y sigue vigente';

CREATE OR REPLACE FUNCTION fn_estadisticas_grupo(p_grupo_id UUID)
RETURNS TABLE (
    total_alumnos BIGINT,
    asistencias BIGINT,
    justificadas BIGINT,
    porcentaje_asistencia NUMERIC(5,2)
)
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
    RETURN QUERY
    SELECT
        COUNT(DISTINCT i.alumno_id) AS total_alumnos,
        COUNT(DISTINCT CASE WHEN eas.codigo = 'ASISTIO' THEN asis.alumno_id END) AS asistencias,
        COUNT(DISTINCT CASE WHEN eas.codigo = 'JUSTIFICADA' THEN asis.alumno_id END) AS justificadas,
        ROUND(
            CASE
                WHEN COUNT(DISTINCT i.alumno_id) = 0 THEN 0
                ELSE (COUNT(DISTINCT CASE WHEN eas.codigo = 'ASISTIO' THEN asis.alumno_id END) * 100.0) / COUNT(DISTINCT i.alumno_id)
            END,
            2
        ) AS porcentaje_asistencia
    FROM grupo g
    LEFT JOIN inscripcion i ON i.grupo_id = g.id
    LEFT JOIN asistencia asis ON asis.alumno_id = i.alumno_id
    LEFT JOIN sesion_evento se ON se.id = asis.sesion_evento_id
    LEFT JOIN evento e ON e.id = se.evento_id AND e.grupo_id = g.id
    LEFT JOIN cat_estados_asistencia eas ON eas.id = asis.estado_id
    WHERE g.id = p_grupo_id
    GROUP BY g.id;
END;
$$;

COMMENT ON FUNCTION fn_estadisticas_grupo(UUID) IS 'Devuelve métricas resumidas de asistencia para un grupo';

COMMIT;
