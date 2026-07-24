UUID - Created at Supbase->Authentication->Users->User ID
--0bec939e-34e3-407e-a545-03e946cc1b66

insert into public.usuario (
  id,
  activo,
  created_at,
  updated_at
)
values (
  '0bec939e-34e3-407e-a545-03e946cc1b66',
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
    '0bec939e-34e3-407e-a545-03e946cc1b66',
    'Admin',
    'Forofos',
    'ST,
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
  '0bec939e-34e3-407e-a545-03e946cc1b66',
  '5ee4f204-0c30-4cfc-bb8b-8a2adcfc50a6',
  '20256-07-22',
  '2026-07-22'
)