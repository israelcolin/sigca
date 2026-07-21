import { Router } from 'express';

import { authMiddleware } from '../../middleware/auth.middleware.js';
import {
  loginController,
  logoutController,
  registerController,
  requestPasswordRecoveryController,
} from './auth.controller.js';

const router = Router();

/**
 * Rutas del módulo de autenticación.
 */
router.post('/login', loginController);
router.post('/logout', authMiddleware, logoutController);
router.post('/register', registerController);
router.post('/forgot-password', requestPasswordRecoveryController);

export default router;
