-- Seed de catálogos base de SIGCA
-- Inserta los catálogos iniciales sin modificar estructuras existentes.

BEGIN;

INSERT INTO cat_roles (codigo, nombre, descripcion, orden, activo)
VALUES
    ('ADMIN', 'Administrador', 'Administrador del sistema', 1, TRUE),
    ('COORD_GENERAL', 'Coordinador General', 'Coordinador general del sistema', 2, TRUE),
    ('CATEQUISTA', 'Catequista', 'Catequista responsable de grupos', 3, TRUE),
    ('AUXILIAR', 'Auxiliar', 'Auxiliar de catequesis', 4, TRUE),
    ('VOLUNTARIO', 'Voluntario', 'Voluntario del equipo catequético', 5, TRUE),
    ('CONSULTA', 'Consulta', 'Usuario con acceso de consulta', 6, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_tipos_evento (codigo, nombre, descripcion, orden, activo)
VALUES
    ('CURSO', 'Curso', 'Evento de tipo curso', 1, TRUE),
    ('MISA', 'Misa', 'Celebración religiosa', 2, TRUE),
    ('RETIRO', 'Retiro', 'Retiro espiritual', 3, TRUE),
    ('PLATICA', 'Platica', 'Plática o charla', 4, TRUE),
    ('CONFESION', 'Confesion', 'Tiempo de confesión', 5, TRUE),
    ('OTRO', 'Otro', 'Otro tipo de evento', 6, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_estados_evento (codigo, nombre, descripcion, orden, activo)
VALUES
    ('PROGRAMADO', 'Programado', 'Evento programado', 1, TRUE),
    ('EN_CURSO', 'En Curso', 'Evento en curso', 2, TRUE),
    ('FINALIZADO', 'Finalizado', 'Evento finalizado', 3, TRUE),
    ('CANCELADO', 'Cancelado', 'Evento cancelado', 4, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_estados_sesion (codigo, nombre, descripcion, orden, activo)
VALUES
    ('PROGRAMADA', 'Programada', 'Sesión programada', 1, TRUE),
    ('ABIERTA', 'Abierta', 'Sesión abierta', 2, TRUE),
    ('CERRADA', 'Cerrada', 'Sesión cerrada', 3, TRUE),
    ('CANCELADA', 'Cancelada', 'Sesión cancelada', 4, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_estados_asistencia (codigo, nombre, descripcion, orden, activo)
VALUES
    ('ASISTIO', 'Asistio', 'Asistencia registrada', 1, TRUE),
    ('JUSTIFICADA', 'Justificada', 'Falta justificada', 2, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_estados_inscripcion (codigo, nombre, descripcion, orden, activo)
VALUES
    ('INSCRITO', 'Inscrito', 'Alumno inscrito', 1, TRUE),
    ('BAJA', 'Baja', 'Alumno dado de baja', 2, TRUE),
    ('CONCLUIDO', 'Concluido', 'Proceso concluido', 3, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_parentescos (codigo, nombre, descripcion, orden, activo)
VALUES
    ('PADRE', 'Padre', 'Parentesco padre', 1, TRUE),
    ('MADRE', 'Madre', 'Parentesco madre', 2, TRUE),
    ('ABUELO', 'Abuelo', 'Parentesco abuelo', 3, TRUE),
    ('ABUELA', 'Abuela', 'Parentesco abuela', 4, TRUE),
    ('TUTOR', 'Tutor', 'Parentesco tutor', 5, TRUE),
    ('HERMANO', 'Hermano', 'Parentesco hermano', 6, TRUE),
    ('OTRO', 'Otro', 'Otro parentesco', 7, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_sacramentos (codigo, nombre, descripcion, orden, activo)
VALUES
    ('BAUTISMO', 'Bautismo', 'Sacramento de bautismo', 1, TRUE),
    ('PRIMERA_COMUNION', 'Primera Communion', 'Sacramento de primera comunión', 2, TRUE),
    ('CONFIRMACION', 'Confirmacion', 'Sacramento de confirmación', 3, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO cat_sexos (codigo, nombre, descripcion, orden, activo)
VALUES
    ('MASCULINO', 'Masculino', 'Sexo masculino', 1, TRUE),
    ('FEMENINO', 'Femenino', 'Sexo femenino', 2, TRUE)
ON CONFLICT (codigo) DO NOTHING;

COMMIT;
