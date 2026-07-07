import type { ErrorRequestHandler } from 'express';

import { error as logError } from '../logger/logger.js';
import { createErrorResponse } from '../responses/api-response.js';

/**
 * Middleware global para capturar errores inesperados.
 */
export const errorHandler: ErrorRequestHandler = (err, _req, res, _next) => {
  const errorMessage = err instanceof Error ? err.message : 'Ocurrió un error inesperado';
  logError('Unhandled error', errorMessage);

  res.status(500).json(
    createErrorResponse('Ocurrió un error inesperado', ['Ocurrió un error inesperado'], {
      timestamp: new Date().toISOString(),
    }),
  );
};

export default errorHandler;
