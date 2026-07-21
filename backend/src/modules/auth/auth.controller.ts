import type { NextFunction, Request, Response } from 'express';

import { login } from './auth.service.js';

/**
 * Controlador del endpoint de inicio de sesión.
 */
export async function loginController(
  req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    const response = await login(req.body);

    res.status(response.success ? 200 : 401).json(response);
  } catch (error) {
    next(error);
  }
}

export default loginController;
