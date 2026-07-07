# Estándares de desarrollo

## Propósito

Estas normas buscan que el futuro código de SIGCA sea legible, seguro, comprobable y consistente. Se aplicarán desde la primera iteración de implementación.

## Idioma y nombres

- Documentación, mensajes funcionales y conceptos del dominio: español claro.
- Elementos técnicos convencionales: inglés cuando mejore la comprensión del ecosistema.
- Variables y funciones: `camelCase`; clases: `PascalCase`; constantes: `UPPER_SNAKE_CASE`.
- Archivos y rutas: minúsculas, nombres descriptivos y una convención uniforme por tipo.
- Evitar abreviaturas ambiguas, nombres genéricos y comentarios que repitan el código.

## JavaScript y Node.js

- Utilizar JavaScript ES6 o posterior dentro de la versión de Node.js oficialmente soportada por el proyecto.
- Adoptar módulos ES y declarar una versión de runtime reproducible.
- Preferir `const`; usar `let` sólo cuando exista reasignación. No usar `var`.
- Usar funciones pequeñas y puras cuando sea razonable.
- Manejar operaciones asíncronas con `async`/`await` y propagar errores de manera explícita.
- No ignorar promesas, excepciones ni resultados de operaciones sensibles.
- Evitar dependencias innecesarias y fijar versiones mediante archivo de bloqueo.

## Diseño y SOLID

- Cada unidad debe tener una responsabilidad y una razón principal para cambiar.
- Extender comportamiento mediante contratos y composición cuando aporte claridad.
- Las implementaciones deben respetar el contrato sustituido.
- Diseñar interfaces pequeñas para necesidades concretas del consumidor.
- La aplicación y el dominio dependerán de abstracciones, no de Express, Supabase o PostgreSQL.
- Favorecer composición sobre herencia y evitar patrones sin una necesidad real.
- No compartir componentes hasta identificar una responsabilidad verdaderamente común.

## Backend

- Las rutas declaran endpoints y middleware; los controladores adaptan HTTP; los casos de uso orquestan; el dominio protege invariantes; los repositorios persisten.
- Un controlador no ejecuta SQL ni contiene reglas funcionales.
- Validar toda entrada en el límite de la API y rechazar propiedades no permitidas.
- Usar consultas parametrizadas, transacciones para cambios atómicos y paginación en colecciones.
- Mantener un formato consistente para respuestas y errores.
- No revelar trazas, detalles de infraestructura o existencia de recursos no autorizados.

## Frontend

- Comenzar por el diseño móvil y ampliar con puntos de quiebre justificados.
- Utilizar elementos HTML semánticos antes que contenedores genéricos.
- Todos los controles deben tener etiqueta, foco visible y uso por teclado.
- MaterializeCSS es la base visual; las personalizaciones deben centralizarse y evitar estilos en línea.
- Separar renderizado, eventos, validación y comunicación con la API.
- Mostrar estados de carga, vacío, éxito y error; no depender sólo del color.
- Escapar contenido dinámico y evitar inserción insegura de HTML.

## Seguridad y privacidad

- Nunca incluir secretos o claves privilegiadas en el frontend o el repositorio.
- Aplicar autorización por recurso, acción y parroquia en el servidor.
- Minimizar la recolección y exposición de datos personales.
- Ocultar datos sensibles en logs, pruebas, capturas y datos semilla.
- Revisar cambios de autenticación, permisos, RLS y migraciones con especial cuidado.
- Tratar dependencias y contenido externo como entradas no confiables.

## Pruebas

- Toda corrección debe incluir una prueba que reproduzca el defecto cuando sea viable.
- Probar reglas de dominio con unitarias y límites externos con integración.
- Incluir casos positivos, negativos, permisos insuficientes y aislamiento entre parroquias.
- Mantener pruebas deterministas, independientes y legibles.
- No perseguir cobertura numérica a costa de escenarios significativos.

## Formato y calidad

- Configurar un formateador y un analizador estático comunes para todo el equipo.
- No mezclar cambios funcionales con reformateos masivos.
- Eliminar código muerto en lugar de comentarlo.
- Los comentarios explican decisiones o restricciones, no la sintaxis.
- Una contribución debe pasar formato, análisis y pruebas antes de integrarse.

## Git y revisión

- Crear ramas breves y cambios pequeños con un objetivo verificable.
- Escribir commits claros y en modo imperativo; se recomienda la convención de *Conventional Commits*.
- La solicitud de cambio debe explicar propósito, alcance, evidencia de prueba, riesgos y cambios visuales o de datos.
- No integrar cambios con pruebas fallidas, secretos, conflictos o documentación desactualizada.
- Las decisiones arquitectónicas duraderas requieren un ADR.

## Definición de terminado

Una tarea está terminada cuando cumple criterios de aceptación, respeta arquitectura y accesibilidad, incluye pruebas pertinentes, no introduce alertas conocidas, actualiza documentación y ha sido revisada.
