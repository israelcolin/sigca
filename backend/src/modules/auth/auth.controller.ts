import type { NextFunction, Request, Response } from 'express';

import { login, logout, register } from './auth.service.js';

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

/**
 * Controlador del endpoint de registro de usuarios.
 */
export async function registerController(
  req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    const response = await register(req.body);

    res.status(response.success ? 201 : 409).json(response);
  } catch (error) {
    next(error);
  }
}

/**
 * Controlador del endpoint de cierre de sesión.
 */
export async function logoutController(
  _req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    res.status(200).json(await logout());
  } catch (error) {
    next(error);
  }
}

export default loginController;
