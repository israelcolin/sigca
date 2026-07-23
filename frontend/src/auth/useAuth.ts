import { useContext } from 'react';

import { AuthContext } from './AuthContext.js';

/** Devuelve el estado y las operaciones de autenticación del proveedor global. */
export function useAuth() {
  const authContext = useContext(AuthContext);

  if (authContext === undefined) {
    throw new Error('useAuth debe utilizarse dentro de un AuthProvider.');
  }

  return authContext;
}
