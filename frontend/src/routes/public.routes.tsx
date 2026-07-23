import { Navigate, type RouteObject } from 'react-router-dom';

import { PrivateLayout, PublicLayout } from '../layouts';
import { authRoutes } from '../modules/auth';
import { DashboardPage } from '../modules/dashboard';
import { ProtectedRoute } from './ProtectedRoute.js';
import { PublicRoute } from './PublicRoute.js';

/**
 * Rutas disponibles sin una sesión autenticada.
 */
export const publicRoutes: RouteObject[] = [
  {
    element: <PublicRoute />,
    children: [
      {
        path: '/',
        element: <Navigate to="/login" replace />,
      },
      {
        element: <PublicLayout />,
        children: authRoutes,
      },
      {
        path: '*',
        element: <Navigate to="/login" replace />,
      },
    ],
  },
  {
    element: <ProtectedRoute />,
    children: [
      {
        element: <PrivateLayout />,
        children: [
          {
            path: '/dashboard',
            element: <DashboardPage />,
          },
        ],
      },
    ],
  },
];
