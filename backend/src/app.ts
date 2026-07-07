import express from 'express';

import { errorHandler } from './core/middleware/error-handler.js';
import { healthRoutes } from './core/modules/health/index.js';
import { welcomeRoutes } from './core/modules/welcome/index.js';

/**
 * Aplicación HTTP de SIGCA.
 *
 * Este módulo se limita a configurar Express y registrar los componentes
 * transversales del Core del sistema.
 */
const app = express();

// Evita publicar un detalle innecesario sobre la tecnología del servidor.
app.disable('x-powered-by');

// Habilita la lectura de solicitudes JSON con un límite conservador inicial.
app.use(express.json({ limit: '100kb' }));

app.use('/', welcomeRoutes);
app.use('/api/v1', healthRoutes);
app.use(errorHandler);

export default app;
