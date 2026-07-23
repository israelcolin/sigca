import express from 'express';
import cors from 'cors';

import { config } from './core/config/config.js';
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
const corsOrigin = config.corsOrigin;

if (!corsOrigin) {
  throw new Error('CORS_ORIGIN debe estar definida.');
}

app.use(
  cors({
    origin: config.corsOrigin,
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
  }),
);


// Evita publicar un detalle innecesario sobre la tecnología del servidor.
app.disable('x-powered-by');

// Habilita la lectura de solicitudes JSON con un límite conservador inicial.
app.use(express.json({ limit: '100kb' }));

app.use('/', welcomeRoutes);
app.use('/api/v1', healthRoutes);
app.use('/api/v1/auth', authRoutes);
app.use(errorHandler);

export default app;
