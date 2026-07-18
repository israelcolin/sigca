import { Router } from 'express';

import { loginController } from './auth.controller.js';

const router = Router();

/**
 * Rutas del módulo de autenticación.
 */
router.post('/login', loginController);

export default router;
