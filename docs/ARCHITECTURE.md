# Arquitectura

## Objetivo

Definir una estructura técnica mantenible para SIGCA que separe responsabilidades, proteja la información entre parroquias y permita evolucionar el producto sin acoplar la interfaz, el dominio y la infraestructura.

## Enfoque

Se adoptará inicialmente un **monolito modular con arquitectura por capas**. Este enfoque reduce complejidad operativa en el MVP y conserva límites internos que permiten extraer módulos en el futuro si existen necesidades verificables de escala.

La API será el punto de entrada a la lógica de negocio. El navegador no accederá directamente a tablas de negocio. Supabase Auth gestionará la identidad; la API verificará el token y resolverá autorización y pertenencia parroquial.

## Capas

| Capa | Responsabilidad | No debe |
|---|---|---|
| Presentación | HTML semántico, MaterializeCSS, interacción ES6 y consumo de API | Contener reglas de negocio ni secretos |
| Rutas y controladores | Recibir solicitudes, validar su forma, invocar casos de uso y traducir respuestas HTTP | Ejecutar consultas o decidir reglas del dominio |
| Aplicación | Orquestar casos de uso, transacciones, autorización y contratos | Depender de Express o detalles visuales |
| Dominio | Modelar entidades, invariantes y políticas catequéticas | Conocer HTTP, Supabase o PostgreSQL |
| Infraestructura | Implementar repositorios, persistencia, autenticación, correo y observabilidad | Definir reglas funcionales |

Las dependencias apuntarán hacia las capas de aplicación y dominio. Las implementaciones de infraestructura se conectarán mediante interfaces o contratos definidos por las capas internas.

## Módulos de negocio previstos

- Identidad y acceso.
- Organizaciones y parroquias.
- Personas y responsables.
- Catequistas.
- Ciclos, niveles y grupos.
- Inscripciones.
- Asistencia y seguimiento.
- Reportes.
- Auditoría.

Cada módulo poseerá sus casos de uso y contratos. Compartirá sólo componentes transversales estables; no se creará una carpeta genérica de utilidades como destino indiscriminado.

## Flujo de una solicitud

1. La persona inicia sesión mediante Supabase Auth.
2. El cliente envía el token de acceso a la API.
3. Un middleware verifica firma, vigencia e identidad.
4. La API obtiene la membresía y los permisos para la parroquia activa.
5. El controlador valida la solicitud e invoca un caso de uso.
6. El caso de uso aplica reglas de dominio y utiliza contratos de repositorio.
7. La infraestructura ejecuta consultas parametrizadas dentro del contexto parroquial.
8. La API devuelve una respuesta normalizada y registra la operación pertinente.

## Estrategia multi-parroquia

Se utilizará una base compartida con discriminador de inquilino. Las tablas operativas incluirán `parroquia_id`; las relaciones, restricciones e índices deberán conservar ese contexto.

La defensa será en profundidad:

- La membresía usuario-parroquia representará roles y estado de acceso.
- La API derivará y verificará el contexto parroquial en cada operación.
- Los repositorios exigirán contexto de parroquia para consultar o modificar datos.
- PostgreSQL aplicará Row Level Security cuando el modelo de conexión lo permita.
- Las claves con privilegios elevados residirán exclusivamente en infraestructura segura.
- Las pruebas incluirán intentos de acceso cruzado entre parroquias.

## Seguridad

- Supabase Auth resuelve identidad; SIGCA conserva roles y permisos de negocio.
- Autenticación no implica autorización.
- Se validarán entrada, tipo de contenido, tamaño y parámetros permitidos.
- Se utilizarán consultas parametrizadas y manejo centralizado de errores.
- No se registrarán tokens, contraseñas ni datos personales innecesarios.
- Las acciones sensibles y cambios de permisos se auditarán.
- Configuración y secretos se separarán del repositorio.
- Se aplicarán controles de tasa, cabeceras seguras, CORS restrictivo y políticas de sesión acordes al despliegue.

## API y contratos

- API HTTP versionada bajo un prefijo estable.
- Recursos y verbos consistentes; estados HTTP semánticos.
- Respuesta de error uniforme con código estable, mensaje seguro y correlación.
- Paginación, filtrado y ordenamiento explícitos en colecciones.
- Contratos documentados antes de integrar frontend y backend.
- Cambios incompatibles requieren nueva versión o estrategia de migración.

## Datos

- PostgreSQL será la fuente de verdad transaccional.
- Las migraciones serán versionadas, revisables y reversibles cuando sea viable.
- Se usarán claves internas estables, restricciones de integridad y marcas de tiempo coherentes.
- La eliminación lógica se usará sólo cuando exista justificación funcional o regulatoria.
- Índices y consultas se validarán con cargas representativas.
- Respaldos, restauración y retención deberán probarse, no sólo configurarse.

## Frontend

- Diseño progresivo desde el ancho móvil hacia pantallas mayores.
- Componentes reutilizables para navegación, formularios, mensajes, tablas adaptables y estados de carga.
- Módulos ES6 con separación entre vistas, estado local y cliente HTTP.
- Mejora progresiva, HTML semántico y accesibilidad como criterio de aceptación.
- Evitar dependencia innecesaria de JavaScript para contenido o acciones básicas.

## Calidad y operación

- Pruebas unitarias del dominio y casos de uso.
- Pruebas de integración de API, persistencia, autenticación y RLS.
- Pruebas de recorrido crítico y aislamiento multi-parroquia.
- Análisis estático, formato, pruebas y revisión en integración continua.
- Registros estructurados, métricas de salud y alertas accionables.

## Evolución

Separar servicios o introducir colas, cachés y procesamiento asíncrono requerirá evidencia de carga, disponibilidad o independencia de despliegue. Toda decisión estructural significativa se registrará mediante un ADR.


Login
    │
    ▼
AuthContext
    │
    ▼
AuthProvider
    │
    ▼
ProtectedRoute
    │
    ▼
Dashboard

401
 ↓
Interceptor
 ↓
AuthContext
 ↓
ProtectedRoute
 ↓
Login