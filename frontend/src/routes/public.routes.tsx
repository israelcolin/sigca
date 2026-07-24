import { Navigate, type RouteObject } from 'react-router-dom';

import { AppLayout, PublicLayout } from '../layouts';
import { authRoutes } from '../modules/auth';
import { DashboardPage } from '../modules/dashboard';
import { navigationItems } from '../config/navigation.js';
import { ComingSoonPage } from '../pages/ComingSoonPage.js';
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
        element: <AppLayout />,
        children: [
          {
            path: '/dashboard',
            element: <DashboardPage />,
          },
          ...navigationItems
            .filter((item) => item.path !== '/dashboard')
            .map((item) => ({
              path: item.path,
              element: <ComingSoonPage moduleName={item.label} />,
            })),
        ],
      },
    ],
  },
];
