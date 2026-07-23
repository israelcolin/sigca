import { Navigate, Outlet } from 'react-router-dom';

import { useAuth } from '../auth/index.js';
import { AuthLoading } from './AuthLoading.js';

/** Restringe el contenido anidado a sesiones autenticadas y ya restauradas. */
export function ProtectedRoute() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return <AuthLoading />;
  }

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  return <Outlet />;
}
