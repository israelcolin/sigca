const SESSION_TOKEN_KEY = 'sigca.access_token';

function getStorage(): Storage | null {
  return typeof window === 'undefined' ? null : window.sessionStorage;
}

/** Obtiene el token de acceso de la sesión actual, si existe. */
export function getSessionToken(): string | null {
  return getStorage()?.getItem(SESSION_TOKEN_KEY) ?? null;
}

/** Persiste exclusivamente el token de acceso de la sesión actual. */
export function setSessionToken(accessToken: string): void {
  getStorage()?.setItem(SESSION_TOKEN_KEY, accessToken);
}

/** Elimina el token de acceso persistido para la sesión actual. */
export function clearSessionToken(): void {
  getStorage()?.removeItem(SESSION_TOKEN_KEY);
}
