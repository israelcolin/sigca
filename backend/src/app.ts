import express from 'express';

import { errorHandler } from './core/middlewares/error-handler.js';
import { authRoutes } from './modules/auth/index.js';
import { healthRoutes } from './modules/health/index.js';
import { welcomeRoutes } from './modules/welcome/index.js';

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
app.use('/api/v1/auth', authRoutes);
app.use(errorHandler);

export default app;
