# ADR-001: Supabase Auth como proveedor de identidad

- **Estado:** aceptada para la arquitectura inicial
- **Fecha:** 2026-07-06
- **Responsables:** equipo de SIGCA

## Contexto

SIGCA necesita autenticar usuarios de diferentes parroquias, mantener sesiones seguras y facilitar procesos como inicio de sesión, recuperación de acceso e invitaciones. Construir y operar un sistema propio de identidad aumentaría el riesgo de seguridad y el costo del MVP.

El proyecto utilizará PostgreSQL en Supabase, por lo que su servicio administrado de autenticación ofrece integración natural con el ecosistema elegido.

## Decisión

Se utilizará **Supabase Auth** como proveedor de identidad. La autenticación confirmará quién es el usuario; la autorización del dominio permanecerá bajo control de SIGCA.

- Supabase Auth administrará identidades, credenciales, tokens y recuperación de acceso.
- La API de Express verificará cada token protegido mediante mecanismos oficiales y validará sus propiedades relevantes.
- Los perfiles, membresías parroquiales, roles y permisos vivirán en el modelo de negocio de SIGCA.
- Ningún rol incluido en metadatos editables por el usuario será una fuente confiable de autorización.
- La parroquia activa no concederá acceso por sí sola: cada solicitud verificará membresía y permiso.
- Las claves administrativas o de servicio nunca se expondrán en el navegador.
- Las políticas RLS complementarán los controles de la API como defensa en profundidad.

Los métodos de acceso habilitados se definirán durante el descubrimiento. Para el MVP se favorecerá el conjunto mínimo necesario.

## Alternativas consideradas

### Autenticación propia

Ofrece control total, pero exige implementar y mantener almacenamiento de credenciales, recuperación, protecciones contra abuso y respuesta a incidentes. Se descarta por riesgo y costo inicial.

### Otro proveedor administrado

Proveedores especializados pueden ofrecer capacidades empresariales más amplias, pero agregan integración y costos antes de validar el producto. Podrán reconsiderarse si aparecen requisitos de federación, cumplimiento o escala que Supabase Auth no cubra.

### Acceso directo del frontend a datos

Supabase permite trabajar directamente desde el cliente bajo RLS. Para SIGCA se descarta como arquitectura principal porque la lógica parroquial, auditoría y casos de uso requieren una frontera de aplicación consistente. La API de Express será esa frontera.

## Consecuencias

### Positivas

- Reduce el manejo directo de credenciales por parte del equipo.
- Acelera los recorridos iniciales de identidad y sesión.
- Se integra con PostgreSQL y RLS de Supabase.
- Permite concentrar el desarrollo en permisos y procesos catequéticos.

### Negativas y riesgos

- Introduce dependencia operativa y técnica de Supabase.
- Requiere comprender correctamente tokens, sesiones, cookies o almacenamiento del cliente y rotación de claves.
- Una configuración incorrecta de RLS o claves privilegiadas puede exponer datos.
- La migración futura de identidades tendría costo.
- La disponibilidad del inicio de sesión depende del proveedor.

## Medidas de mitigación

- Encapsular la verificación de identidad detrás de un adaptador de infraestructura.
- Mantener autorización y perfiles del dominio desacoplados del proveedor.
- Automatizar pruebas de tokens inválidos, sesiones vencidas, permisos y acceso entre parroquias.
- Revisar RLS y gestión de secretos antes de cada despliegue relevante.
- Documentar procedimientos de revocación, incidentes y recuperación.
- Evaluar periódicamente costos, límites, disponibilidad y portabilidad.

## Criterios de revisión

La decisión se revisará si surgen requisitos de inicio de sesión empresarial, residencia de datos, disponibilidad, cumplimiento, costos o portabilidad que el servicio no satisfaga.
