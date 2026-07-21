Contenido:

El SupabaseClient singleton representa únicamente el acceso a Supabase.
Nunca representa la sesión de un usuario.
La identidad del usuario siempre proviene de la petición HTTP.
Los clientes asociados al usuario se crearán por solicitud cuando la arquitectura lo requiera.
No se almacenará estado de autenticación en objetos compartidos.

Estas dos DEC dejan una base muy clara para las iteraciones de autenticación y autorización.

Estado actual

El cliente compartido del Core está configurado para no persistir sesiones ni refrescar tokens automáticamente.

Objetivo arquitectónico

La identidad del usuario deberá obtenerse exclusivamente del contexto de cada solicitud HTTP mediante un cliente asociado a la petición.

Hasta que dicha infraestructura sea implementada, el cliente compartido del Core no deberá utilizarse para representar la identidad de un usuario autenticado.