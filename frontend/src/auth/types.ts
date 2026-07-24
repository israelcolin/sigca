/** Información mínima disponible para identificar al usuario autenticado. */
export interface AuthenticatedUser {
  id: string;
  nombre: string;
  correo?: string;
  rol: string;
  photoUrl?: string | null;
}

/** Convierte el contrato normalizado de Auth al estado interno del Frontend. */
export function toAuthenticatedUser(user: {
  id: string;
  name: string;
  role: string;
  email?: string;
}): AuthenticatedUser {
  return {
    id: user.id,
    nombre: user.name,
    ...(user.email === undefined ? {} : { correo: user.email }),
    rol: user.role,
  };
}

/** Estado global de autenticación disponible para la aplicación. */
export interface AuthState {
  user: AuthenticatedUser | null;
  isAuthenticated: boolean;
  isLoading: boolean;
}

/** Operaciones de autenticación preparadas para iteraciones posteriores. */
export interface AuthContextValue extends AuthState {
  authenticatedUser: AuthenticatedUser | null;
  setAuthenticatedUser: (user: AuthenticatedUser) => void;
  clearAuthentication: () => void;
  logout: () => Promise<void>;
}
