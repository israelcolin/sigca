import {
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
  type PropsWithChildren,
} from 'react';

import { HttpClientError } from '../api/index.js';
import { authService } from '../services/auth/index.js';
import { clearSessionToken, getSessionToken } from '../storage/index.js';
import { AuthContext } from './AuthContext.js';
import { subscribeToSessionUnauthorized } from './session-events.js';
import {
  toAuthenticatedUser,
  type AuthContextValue,
  type AuthState,
  type AuthenticatedUser,
} from './types.js';

const initialAuthState: AuthState = {
  user: null,
  isAuthenticated: false,
  isLoading: true,
};

/** Proporciona el estado de autenticación en memoria a toda la aplicación. */
export function AuthProvider({ children }: PropsWithChildren) {
  const [authState, setAuthState] = useState<AuthState>(initialAuthState);
  const hasRestoredSession = useRef(false);

  const setAuthenticatedUser = useCallback((user: AuthenticatedUser) => {
    setAuthState({
      user,
      isAuthenticated: true,
      isLoading: false,
    });
  }, []);

  const clearAuthentication = useCallback(() => {
    setAuthState({ ...initialAuthState, isLoading: false });
  }, []);

  const logout = useCallback(async () => {
    try {
      await authService.logout();
    } finally {
      clearSessionToken();
      clearAuthentication();
    }
  }, [clearAuthentication]);

  useEffect(() => subscribeToSessionUnauthorized(clearAuthentication), [clearAuthentication]);

  useEffect(() => {
    if (hasRestoredSession.current) {
      return;
    }

    hasRestoredSession.current = true;

    async function restoreSession(): Promise<void> {
      if (getSessionToken() === null) {
        clearAuthentication();
        return;
      }

      try {
        const response = await authService.getSession();

        if (response.success) {
          setAuthenticatedUser(toAuthenticatedUser(response.data));
          return;
        }

        clearSessionToken();
        clearAuthentication();
      } catch (error) {
        if (error instanceof HttpClientError && (error.status === 401 || error.status === 403)) {
          clearSessionToken();
        }

        clearAuthentication();
      }
    }

    void restoreSession();
  }, [clearAuthentication, setAuthenticatedUser]);

  const contextValue = useMemo<AuthContextValue>(
    () => ({
      ...authState,
      authenticatedUser: authState.user,
      setAuthenticatedUser,
      clearAuthentication,
      logout,
    }),
    [authState, clearAuthentication, logout, setAuthenticatedUser],
  );

  return <AuthContext.Provider value={contextValue}>{children}</AuthContext.Provider>;
}
