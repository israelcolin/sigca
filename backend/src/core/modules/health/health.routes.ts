import { Router } from 'express';

import { healthController } from './health.controller.js';

const router = Router();

/**
 * Ruta para verificar la salud del backend.
 */
router.get('/health', healthController);

export default router;
