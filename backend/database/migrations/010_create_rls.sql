-- Migración de RLS base de SIGCA
-- Habilita Row Level Security y aplica políticas básicas para usuarios autenticados.

BEGIN;

ALTER TABLE cat_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_tipos_evento ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_estados_evento ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_estados_sesion ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_estados_asistencia ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_estados_inscripcion ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_parentescos ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_sacramentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE cat_sexos ENABLE ROW LEVEL SECURITY;

ALTER TABLE usuario ENABLE ROW LEVEL SECURITY;
ALTER TABLE perfil ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuario_rol ENABLE ROW LEVEL SECURITY;

ALTER TABLE parroquia ENABLE ROW LEVEL SECURITY;
ALTER TABLE ciclo ENABLE ROW LEVEL SECURITY;
ALTER TABLE libro ENABLE ROW LEVEL SECURITY;
ALTER TABLE grupo ENABLE ROW LEVEL SECURITY;

ALTER TABLE tutor ENABLE ROW LEVEL SECURITY;
ALTER TABLE alumno ENABLE ROW LEVEL SECURITY;
ALTER TABLE inscripcion ENABLE ROW LEVEL SECURITY;
ALTER TABLE codigo_qr ENABLE ROW LEVEL SECURITY;
ALTER TABLE credencial ENABLE ROW LEVEL SECURITY;
ALTER TABLE sacramento ENABLE ROW LEVEL SECURITY;

ALTER TABLE evento ENABLE ROW LEVEL SECURITY;
ALTER TABLE sesion_evento ENABLE ROW LEVEL SECURITY;
ALTER TABLE asistencia ENABLE ROW LEVEL SECURITY;

ALTER TABLE evaluacion ENABLE ROW LEVEL SECURITY;
ALTER TABLE resultado_evaluacion ENABLE ROW LEVEL SECURITY;
ALTER TABLE certificado ENABLE ROW LEVEL SECURITY;

DO $$
DECLARE
    r record;
BEGIN
    FOR r IN (
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
          AND table_name IN (
              'cat_roles', 'cat_tipos_evento', 'cat_estados_evento', 'cat_estados_sesion',
              'cat_estados_asistencia', 'cat_estados_inscripcion', 'cat_parentescos',
              'cat_sacramentos', 'cat_sexos', 'usuario', 'perfil', 'usuario_rol', 'parroquia',
              'ciclo', 'libro', 'grupo', 'tutor', 'alumno', 'inscripcion', 'codigo_qr',
              'credencial', 'sacramento', 'evento', 'sesion_evento', 'asistencia',
              'evaluacion', 'resultado_evaluacion', 'certificado'
          )
    ) LOOP
        IF NOT EXISTS (
            SELECT 1
            FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = r.table_name
              AND policyname = 'pol_' || r.table_name || '_authenticated'
        ) THEN
            IF r.table_name IN ('cat_roles', 'cat_tipos_evento', 'cat_estados_evento', 'cat_estados_sesion', 'cat_estados_asistencia', 'cat_estados_inscripcion', 'cat_parentescos', 'cat_sacramentos', 'cat_sexos') THEN
                EXECUTE format('CREATE POLICY pol_%I_authenticated ON %I FOR SELECT TO authenticated USING (auth.uid() IS NOT NULL);', r.table_name, r.table_name);
            ELSE
                EXECUTE format('CREATE POLICY pol_%I_authenticated ON %I FOR ALL TO authenticated USING (auth.uid() IS NOT NULL) WITH CHECK (auth.uid() IS NOT NULL);', r.table_name, r.table_name);
            END IF;
        END IF;
    END LOOP;
END
$$;

COMMIT;
