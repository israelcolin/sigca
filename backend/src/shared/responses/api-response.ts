/**
 * Metadatos comunes incluidos en todas las respuestas de la API.
 */
export interface ApiMeta {
  [key: string]: unknown;
}

/**
 * Respuesta estándar cuando la operación se completa con éxito.
 */
export interface ApiSuccessResponse<T = unknown> {
  success: true;
  message: string;
  data: T;
  meta: ApiMeta;
}

/**
 * Respuesta estándar cuando la operación falla.
 */
export interface ApiErrorResponse {
  success: false;
  message: string;
  errors: string[];
  meta: ApiMeta;
}

export type ApiResponse<T = unknown> = ApiSuccessResponse<T> | ApiErrorResponse;

/**
 * Crea una respuesta estándar de éxito.
 */
export function createSuccessResponse<T>(
  data: T,
  message = 'Operación exitosa',
  meta: ApiMeta = {},
): ApiSuccessResponse<T> {
  return {
    success: true,
    message,
    data,
    meta,
  };
}

/**
 * Crea una respuesta estándar de error.
 */
export function createErrorResponse(
  message = 'Ocurrió un error inesperado',
  errors: string[] = [],
  meta: ApiMeta = {},
): ApiErrorResponse {
  return {
    success: false,
    message,
    errors: errors.length > 0 ? errors : [message],
    meta,
  };
}
