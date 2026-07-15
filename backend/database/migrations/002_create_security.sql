-- Migración de seguridad base de SIGCA
-- Implementa las tablas de seguridad sin datos iniciales ni RLS.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS usuario (
    id UUID PRIMARY KEY,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    ultimo_acceso TIMESTAMPTZ NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT usuario_auth_fk FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE
);

COMMENT ON TABLE usuario IS 'Entidad de usuarios del sistema';
COMMENT ON COLUMN usuario.id IS 'Identificador del usuario vinculado a auth.users';
COMMENT ON COLUMN usuario.activo IS 'Indica si el usuario está activo';
COMMENT ON COLUMN usuario.ultimo_acceso IS 'Fecha y hora del último acceso del usuario';
COMMENT ON COLUMN usuario.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN usuario.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS perfil (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NULL,
    telefono VARCHAR(30) NULL,
    correo_alternativo VARCHAR(255) NULL,
    fotografia_url TEXT NULL,
    fecha_nacimiento DATE NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT perfil_nombre_no_vacio CHECK (length(trim(nombre)) > 0),
    CONSTRAINT perfil_apellido_paterno_no_vacio CHECK (length(trim(apellido_paterno)) > 0),
    CONSTRAINT perfil_usuario_id_fk FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE ON UPDATE CASCADE
);

COMMENT ON TABLE perfil IS 'Perfil de información personal del usuario';
COMMENT ON COLUMN perfil.id IS 'Identificador único del perfil';
COMMENT ON COLUMN perfil.usuario_id IS 'Referencia al usuario asociado';
COMMENT ON COLUMN perfil.nombre IS 'Nombre del usuario';
COMMENT ON COLUMN perfil.apellido_paterno IS 'Apellido paterno del usuario';
COMMENT ON COLUMN perfil.apellido_materno IS 'Apellido materno del usuario';
COMMENT ON COLUMN perfil.telefono IS 'Teléfono de contacto del usuario';
COMMENT ON COLUMN perfil.correo_alternativo IS 'Correo alternativo del usuario';
COMMENT ON COLUMN perfil.fotografia_url IS 'URL de la fotografía del usuario';
COMMENT ON COLUMN perfil.fecha_nacimiento IS 'Fecha de nacimiento del usuario';
COMMENT ON COLUMN perfil.observaciones IS 'Observaciones adicionales del perfil';
COMMENT ON COLUMN perfil.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN perfil.updated_at IS 'Fecha de última modificación del registro';

CREATE TABLE IF NOT EXISTS usuario_rol (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id UUID NOT NULL,
    rol_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT usuario_rol_usuario_id_fk FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT usuario_rol_rol_id_fk FOREIGN KEY (rol_id) REFERENCES cat_roles (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT usuario_rol_unique UNIQUE(usuario_id, rol_id)
);

COMMENT ON TABLE usuario_rol IS 'Asignación de roles a usuarios';
COMMENT ON COLUMN usuario_rol.id IS 'Identificador único de la asignación';
COMMENT ON COLUMN usuario_rol.usuario_id IS 'Referencia al usuario';
COMMENT ON COLUMN usuario_rol.rol_id IS 'Referencia al rol asignado';
COMMENT ON COLUMN usuario_rol.created_at IS 'Fecha de creación del registro';
COMMENT ON COLUMN usuario_rol.upd   ated_at IS 'Fecha de última modificación del registro';

COMMIT;
