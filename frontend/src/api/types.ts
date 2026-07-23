/** Metadatos comunes incluidos en las respuestas del Backend. */
export interface ApiMeta {
  [key: string]: unknown;
}

/** Respuesta estándar del Backend cuando una operación es exitosa. */
export interface ApiSuccessResponse<T> {
  success: true;
  message: string;
  data: T;
  meta: ApiMeta;
}

/** Respuesta estándar del Backend cuando una operación falla. */
export interface ApiErrorResponse {
  success: false;
  message: string;
  errors: string[];
  meta: ApiMeta;
}

/** Contrato común de las respuestas públicas de la API. */
export type ApiResponse<T> = ApiSuccessResponse<T> | ApiErrorResponse;

/** Error técnico normalizado por el cliente HTTP. */
export class HttpClientError extends Error {
  constructor(
    message: string,
    public readonly status: number | null,
    public readonly errors: string[] = [],
  ) {
    super(message);
    this.name = 'HttpClientError';
  }
}

export const HTTP_TIMEOUT_MS = 10_000;
