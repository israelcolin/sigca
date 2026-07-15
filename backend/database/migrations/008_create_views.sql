-- Migración de vistas base de SIGCA
-- Implementa vistas de consulta para el backend sin modificar estructuras existentes.

BEGIN;

CREATE OR REPLACE VIEW vw_alumnos AS
SELECT
    a.id AS alumno_id,
    a.curp,
    a.nombre AS alumno_nombre,
    a.apellido_paterno AS alumno_apellido_paterno,
    a.apellido_materno AS alumno_apellido_materno,
    a.fecha_nacimiento,
    s.nombre AS sexo,
    t.id AS tutor_id,
    t.nombre AS tutor_nombre,
    t.apellido_paterno AS tutor_apellido_paterno,
    t.apellido_materno AS tutor_apellido_materno,
    g.id AS grupo_id,
    g.nombre AS grupo_nombre,
    l.id AS libro_id,
    l.nombre AS libro_nombre,
    c.id AS ciclo_id,
    c.nombre AS ciclo_nombre,
    qr.codigo AS qr_vigente
FROM alumno a
LEFT JOIN cat_sexos s ON s.id = a.sexo_id
LEFT JOIN tutor t ON t.id = a.tutor_id
LEFT JOIN inscripcion i ON i.alumno_id = a.id
LEFT JOIN grupo g ON g.id = i.grupo_id
LEFT JOIN libro l ON l.id = g.libro_id
LEFT JOIN ciclo c ON c.id = g.ciclo_id
LEFT JOIN codigo_qr qr ON qr.alumno_id = a.id AND qr.vigente = TRUE;

COMMENT ON VIEW vw_alumnos IS 'Vista consolidada con información de alumnos, tutores, grupos, libros, ciclos y QR vigente';

CREATE OR REPLACE VIEW vw_asistencia_alumno AS
SELECT
    a.id AS alumno_id,
    a.nombre AS alumno_nombre,
    a.apellido_paterno AS alumno_apellido_paterno,
    a.apellido_materno AS alumno_apellido_materno,
    se.id AS sesion_id,
    e.id AS evento_id,
    e.nombre AS evento_nombre,
    se.fecha,
    eas.nombre AS estado_asistencia,
    u.id AS registrado_por_usuario_id,
    u.id AS usuario_registro_id
FROM asistencia asis
JOIN alumno a ON a.id = asis.alumno_id
JOIN sesion_evento se ON se.id = asis.sesion_evento_id
JOIN evento e ON e.id = se.evento_id
LEFT JOIN cat_estados_asistencia eas ON eas.id = asis.estado_id
LEFT JOIN usuario u ON u.id = asis.registrado_por_usuario_id;

COMMENT ON VIEW vw_asistencia_alumno IS 'Vista consolidada de asistencias registradas por alumno y sesión';

CREATE OR REPLACE VIEW vw_asistencia_grupo AS
SELECT
    g.id AS grupo_id,
    g.nombre AS grupo_nombre,
    a.id AS alumno_id,
    a.nombre AS alumno_nombre,
    a.apellido_paterno AS alumno_apellido_paterno,
    a.apellido_materno AS alumno_apellido_materno,
    se.fecha,
    eas.nombre AS estado_asistencia
FROM asistencia asis
JOIN sesion_evento se ON se.id = asis.sesion_evento_id
JOIN evento e ON e.id = se.evento_id
JOIN grupo g ON g.id = e.grupo_id
JOIN alumno a ON a.id = asis.alumno_id
LEFT JOIN cat_estados_asistencia eas ON eas.id = asis.estado_id;

COMMENT ON VIEW vw_asistencia_grupo IS 'Vista consolidada de asistencias agrupadas por grupo y alumno';

CREATE OR REPLACE VIEW vw_eventos AS
SELECT
    e.id AS evento_id,
    e.nombre AS evento_nombre,
    e.descripcion AS evento_descripcion,
    cte.nombre AS tipo_evento,
    g.id AS grupo_id,
    g.nombre AS grupo_nombre,
    l.id AS libro_id,
    l.nombre AS libro_nombre,
    cyc.id AS ciclo_id,
    cyc.nombre AS ciclo_nombre
FROM evento e
LEFT JOIN cat_tipos_evento cte ON cte.id = e.tipo_evento_id
LEFT JOIN grupo g ON g.id = e.grupo_id
LEFT JOIN libro l ON l.id = g.libro_id
LEFT JOIN ciclo cyc ON cyc.id = g.ciclo_id;

COMMENT ON VIEW vw_eventos IS 'Vista consolidada con información de eventos, tipos, grupos, libros y ciclos';

CREATE OR REPLACE VIEW vw_certificados AS
SELECT
    a.id AS alumno_id,
    a.nombre AS alumno_nombre,
    a.apellido_paterno AS alumno_apellido_paterno,
    a.apellido_materno AS alumno_apellido_materno,
    l.id AS libro_id,
    l.nombre AS libro_nombre,
    c.id AS ciclo_id,
    c.nombre AS ciclo_nombre,
    cert.fecha_emision,
    cert.porcentaje_asistencia,
    cert.aprobado
FROM certificado cert
JOIN alumno a ON a.id = cert.alumno_id
JOIN libro l ON l.id = cert.libro_id
JOIN ciclo c ON c.id = cert.ciclo_id;

COMMENT ON VIEW vw_certificados IS 'Vista consolidada de certificados emitidos por alumno, libro y ciclo';

CREATE OR REPLACE VIEW vw_estadisticas_grupo AS
SELECT
    g.id AS grupo_id,
    g.nombre AS grupo_nombre,
    COUNT(DISTINCT a.id) AS total_alumnos,
    COUNT(DISTINCT CASE WHEN eas.codigo = 'ASISTIO' THEN asis.alumno_id END) AS asistencias,
    COUNT(DISTINCT CASE WHEN eas.codigo = 'JUSTIFICADA' THEN asis.alumno_id END) AS justificadas,
    ROUND(
        CASE
            WHEN COUNT(DISTINCT a.id) = 0 THEN 0
            ELSE (COUNT(DISTINCT CASE WHEN eas.codigo = 'ASISTIO' THEN asis.alumno_id END) * 100.0) / COUNT(DISTINCT a.id)
        END,
        2
    ) AS porcentaje_asistencia
FROM grupo g
LEFT JOIN inscripcion i ON i.grupo_id = g.id
LEFT JOIN alumno a ON a.id = i.alumno_id
LEFT JOIN asistencia asis ON asis.alumno_id = a.id
LEFT JOIN cat_estados_asistencia eas ON eas.id = asis.estado_id
GROUP BY g.id, g.nombre;

COMMENT ON VIEW vw_estadisticas_grupo IS 'Vista consolidada con estadísticas de asistencia por grupo';

COMMIT;
