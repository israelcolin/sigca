import { Router } from 'express';

import { welcomeController } from './welcome.controller.js';

const router = Router();

/**
 * Ruta de bienvenida para desarrollo local.
 */
router.get('/', welcomeController);

export default router;
