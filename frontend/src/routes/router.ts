import { createBrowserRouter } from 'react-router-dom';

import { publicRoutes } from './public.routes.js';

/**
 * Punto central de navegación de la aplicación.
 */
export const appRouter = createBrowserRouter(publicRoutes);
