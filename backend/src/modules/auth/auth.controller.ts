import type { NextFunction, Request, Response } from 'express';

import {
  getSession,
  login,
  logout,
  register,
  requestPasswordRecovery,
} from './auth.service.js';
import { createErrorResponse } from '../../shared/responses/api-response.js';

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

    const statusCode = response.success
      ? 200
      : response.meta.code === 'AUTH_PROFILE_INCOMPLETE'
        ? 403
        : 401;

    res.status(statusCode).json(response);
  } catch (error) {
    next(error);
  }
}

/**
 * Controlador del endpoint de validación de la sesión autenticada.
 */
export async function sessionController(
  req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    if (req.auth === undefined) {
      res.status(401).json(createErrorResponse('No autorizado'));
      return;
    }

    const response = await getSession(req.auth.user, req.auth.supabase);

    res.status(response.success ? 200 : 403).json(response);
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
 * Controlador del endpoint de recuperación de contraseña.
 */
export async function requestPasswordRecoveryController(
  req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    res.status(200).json(await requestPasswordRecovery(req.body));
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
