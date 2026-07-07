# Contexto del proyecto

## Identidad

- **Nombre:** SIGCA.
- **Significado:** Sistema Integral de Gestión Catequética.
- **Tipo:** plataforma web responsiva y *mobile first*.
- **Etapa actual:** descubrimiento, definición y documentación.

## Problema

La administración catequética suele distribuirse entre hojas de cálculo, formularios, documentos y conversaciones aisladas. Esto dificulta mantener datos consistentes, conocer el avance de cada grupo, controlar accesos y generar información confiable para la toma de decisiones.

SIGCA centralizará estos procesos y proporcionará una experiencia uniforme para distintas parroquias, sin mezclar su información.

## Visión

Ser una plataforma segura, sencilla y extensible que acompañe el ciclo catequético completo, permita a cada parroquia conservar su autonomía operativa y facilite una gestión pastoral informada.

## Usuarios previstos

- **Administrador del sistema:** configura la plataforma y administra organizaciones.
- **Administrador parroquial:** gestiona configuración, usuarios y operación de su parroquia.
- **Coordinador:** organiza ciclos, niveles, grupos y catequistas.
- **Catequista:** consulta sus grupos y registra asistencia o seguimiento.
- **Personal de apoyo:** realiza tareas administrativas autorizadas.
- **Tutor o responsable:** posible usuario futuro para consultar o aportar información del catequizando.

Los permisos definitivos se documentarán mediante una matriz de roles antes de implementar el MVP.

## Alcance funcional inicial

- Gestión de parroquias y pertenencia de usuarios.
- Autenticación y control de acceso por roles.
- Catálogos de ciclos, niveles, sedes o comunidades y grupos.
- Registro de catequistas, catequizandos y responsables.
- Inscripciones y asignación a grupos.
- Registro y consulta de asistencia.
- Seguimiento básico del proceso formativo.
- Reportes operativos esenciales.

## Fuera del alcance inicial

- Aplicaciones móviles nativas.
- Facturación o contabilidad parroquial general.
- Gestión sacramental completa ajena al proceso catequético.
- Mensajería masiva, pagos en línea e integraciones externas no esenciales.
- Analítica avanzada o funcionamiento sin conexión.

## Requisitos no funcionales

- **Seguridad:** mínimo privilegio, sesiones seguras, trazabilidad y protección de datos personales.
- **Multi-tenencia:** toda información operativa pertenece a una parroquia y debe permanecer aislada.
- **Usabilidad:** flujos breves, lenguaje claro y prioridad a pantallas móviles.
- **Accesibilidad:** HTML semántico, navegación por teclado, contraste y etiquetas comprensibles.
- **Mantenibilidad:** arquitectura por capas, SOLID, pruebas y documentación viva.
- **Escalabilidad:** crecimiento horizontal de la API y modelo de datos preparado para múltiples parroquias.
- **Observabilidad:** registros estructurados, identificadores de correlación y auditoría de acciones sensibles.
- **Rendimiento:** paginación, consultas indexadas y cargas acotadas desde el diseño.

## Reglas de dominio iniciales

- Un usuario puede pertenecer a una o más parroquias con roles diferentes.
- Los recursos operativos deben estar asociados explícitamente a una parroquia.
- Ningún rol parroquial puede consultar o modificar datos de otra parroquia.
- Una inscripción vincula a un catequizando con un ciclo y un grupo determinados.
- Las reglas definitivas de edad, niveles, promociones, documentos y asistencia requieren validación con responsables del dominio.

## Supuestos y decisiones pendientes

- Definir responsables del producto y del tratamiento de datos.
- Validar terminología y procesos con representantes de varias parroquias.
- Determinar jurisdicción, política de privacidad, consentimiento, retención y eliminación de datos, especialmente de menores.
- Aprobar matriz de roles y permisos.
- Definir indicadores de éxito y volumen esperado de usuarios y registros.
- Elegir estrategia de despliegue, monitoreo, respaldos y recuperación.

## Criterio de éxito del MVP

Una parroquia piloto puede configurar un ciclo, incorporar usuarios autorizados, registrar catequizandos, organizarlos en grupos, controlar asistencia y consultar información operativa sin acceder a datos de otra parroquia.
