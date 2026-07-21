Decisión

SIGCA utilizará el modelo de autenticación stateless proporcionado por Supabase Auth.

Justificación
Supabase es la autoridad para la autenticación.
La API de SIGCA no almacenará sesiones propias.
Los JWT emitidos por Supabase serán la fuente de identidad.
La API únicamente validará los tokens y aplicará autorización.
Se evita duplicar la gestión de sesiones.
Se reduce la complejidad del backend.
Consecuencias
logout consistirá en invalidar la sesión desde Supabase.
El middleware JWT validará tokens emitidos por Supabase.
No existirán tablas de sesiones propias en SIGCA (salvo que un futuro DEC cambie esta decisión).

Esta DEC dará coherencia a las iteraciones 10.4, 10.7 y 10.8.