export interface AuthLoginResponse {
  success: false;
  message: 'Not implemented';
}

/**
 * Devuelve la respuesta temporal del inicio de sesión.
 */
export function login(): AuthLoginResponse {
  return {
    success: false,
    message: 'Not implemented',
  };
}
