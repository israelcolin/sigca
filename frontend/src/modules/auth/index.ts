import { createElement } from 'react';
import type { RouteObject } from 'react-router-dom';

import { LoginPage } from './LoginPage.js';

export { LoginForm } from './LoginForm.js';
export { LoginPage } from './LoginPage.js';

/**
 * Rutas públicas pertenecientes al módulo de autenticación.
 */
export const authRoutes: RouteObject[] = [
  {
    path: 'login',
    element: createElement(LoginPage),
  },
];
