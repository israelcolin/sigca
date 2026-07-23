import { Navigate, Outlet } from 'react-router-dom';

import { useAuth } from '../auth/index.js';
import { AuthLoading } from './AuthLoading.js';

/** Impide que una sesión autenticada permanezca en rutas públicas. */
export function PublicRoute() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return <AuthLoading />;
  }

  if (isAuthenticated) {
    return <Navigate to="/dashboard" replace />;
  }

  return <Outlet />;
}
