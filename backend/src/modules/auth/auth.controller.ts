import type { Request, Response } from 'express';

import { login } from './auth.service.js';

/**
 * Controlador del endpoint de inicio de sesión.
 */
export function loginController(_req: Request, res: Response): void {
  res.status(200).json(login());
}

export default loginController;
