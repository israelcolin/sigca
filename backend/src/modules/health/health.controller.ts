import type { Request, Response } from 'express';

import { createSuccessResponse } from '../../shared/responses/api-response.js';
import { getHealthPayload } from './health.service.js';

/**
 * Controlador del endpoint de salud.
 */
export function healthController(_req: Request, res: Response): void {
  res.status(200).json(
    createSuccessResponse(getHealthPayload(), 'SIGCA operativo', {}),
  );
}

export default healthController;
