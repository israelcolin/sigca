export interface WelcomePageContext {
  systemName: string;
  systemVersion: string;
  environment: string;
  port: string;
  healthPath: string;
  startedAt: string;
}

/**
 * Genera la respuesta HTML de la ruta raíz para desarrollo local.
 */
export function buildWelcomePage(context: WelcomePageContext): string {
  return `<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${context.systemName}</title>
  </head>
  <body>
    <main>
      <h1>${context.systemName}</h1>
      <p>Sistema Integral de Gestión Catequética</p>
      <p>Servidor funcionando correctamente.</p>
      <p><strong>Versión:</strong> ${context.systemVersion}</p>
      <p><strong>Ambiente:</strong> ${context.environment}</p>
      <p><strong>Fecha y hora del servidor:</strong> ${context.startedAt}</p>
      <p><strong>Ruta Health:</strong> <a href="${context.healthPath}">${context.healthPath}</a></p>
    </main>
  </body>
</html>`;
}

/**
 * Genera el bloque de consola mostrado al iniciar el servidor.
 */
export function buildStartupBanner(context: WelcomePageContext): string {
  return `========================================================
${context.systemName}
Sistema Integral de Gestión Catequética

Versión:
${context.systemVersion}

Ambiente:
${context.environment}

Servidor:
Operativo

Puerto:
${context.port}

URL:
http://localhost:${context.port}

Health:
http://localhost:${context.port}${context.healthPath}

Inicio:
${context.startedAt}
========================================================`;
}
