import app from './app.js';
import { config } from './core/config/config.js';
import { logger } from './core/logger/logger.js';
import { buildStartupBanner } from './modules/welcome/welcome.service.js';

/**
 * Puerto HTTP configurado para el proceso.
 *
 * La variable se conserva como texto porque Node.js y Express aceptan tanto
 * puertos numéricos como nombres de canal compatibles con el sistema.
 */
const port = config.port;

/**
 * Inicia exclusivamente el servidor HTTP.
 *
 * Mantener el arranque separado de `app.ts` permite importar la aplicación
 * desde pruebas futuras sin abrir conexiones de red involuntariamente.
 */
app.listen(port, () => {
  const startedAt = new Date().toLocaleString('es-ES', {
    timeZone: 'America/Argentina/Buenos_Aires',
  });

  logger.info(
    buildStartupBanner({
      systemName: config.systemName,
      systemVersion: config.systemVersion,
      environment: config.nodeEnv,
      port,
      healthPath: '/api/v1/health',
      startedAt,
    }),
  );
});
