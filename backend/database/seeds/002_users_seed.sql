UUID - Created at Supbase->Authentication->Users->User ID

insert into public.usuario (
  id,
  activo,
  created_at,
  updated_at
)
values (
  '0f9bd3cd-15ea-4b17-a559-dffe5aafdbd1',
  true,
  '2026-07-22',
  '2026-07-22'
);

INSERT INTO public.perfil(
   usuario_id,
   nombre,
   apellido_paterno,
   apellido_materno,
   telefono,
   fecha_nacimiento,
   created_at,
   updated_at
   )
   VALUES(
    '0f9bd3cd-15ea-4b17-a559-dffe5aafdbd1',
    'Israel',
    'Sánchez',
    'Colín',
    '7223509608',
    '1981-02-13',
    '2026-07-22',
    '2026-07-22'
   );

select
  id,
  codigo,
  nombre
from public.cat_roles
where codigo = 'ADMIN';

INSERT INTO public.usuario_rol(
  usuario_id,
  rol_id,
  created_at,
  updated_at
)
VALUES (
  '0f9bd3cd-15ea-4b17-a559-dffe5aafdbd1',
  '5ee4f204-0c30-4cfc-bb8b-8a2adcfc50a6',
  '20256-07-22',
  '2026-07-22'
)