import type { Request, Response } from 'express';

import { config } from '../../config/config.js';
import { buildWelcomePage } from './welcome.service.js';

/**
 * Controlador para la ruta raíz del backend.
 */
export function welcomeController(_req: Request, res: Response): void {
  const startedAt = new Date().toLocaleString('es-ES', {
    timeZone: 'America/Argentina/Buenos_Aires',
  });

  res.status(200).type('html').send(
    buildWelcomePage({
      systemName: config.systemName,
      systemVersion: config.systemVersion,
      environment: config.nodeEnv,
      port: config.port,
      healthPath: '/api/v1/health',
      startedAt,
    }),
  );
}

export default welcomeController;
