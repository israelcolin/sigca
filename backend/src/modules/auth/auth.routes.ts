import { Router } from 'express';

import {
  loginController,
  logoutController,
  registerController,
} from './auth.controller.js';

const router = Router();

/**
 * Rutas del módulo de autenticación.
 */
router.post('/login', loginController);
router.post('/logout', logoutController);
router.post('/register', registerController);

export default router;
