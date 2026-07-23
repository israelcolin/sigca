import { isAxiosError, type AxiosInstance, type InternalAxiosRequestConfig } from 'axios';

import { notifySessionUnauthorized } from '../auth/session-events.js';
import { clearSessionToken, getSessionToken } from '../storage/index.js';
import { HttpClientError, type ApiErrorResponse } from './types.js';

function normalizeHttpError(error: unknown): HttpClientError {
  if (!isAxiosError<ApiErrorResponse>(error)) {
    return new HttpClientError('No fue posible completar la solicitud.', null);
  }

  const response = error.response;
  const responseData = response?.data;

  return new HttpClientError(
    responseData?.message ?? 'No fue posible completar la solicitud.',
    response?.status ?? null,
    responseData?.errors ?? [],
  );
}

function isLoginRequest(url: string | undefined): boolean {
  return url?.replace(/^\/+/, '').startsWith('auth/login') ?? false;
}

function addAuthorizationHeader(config: InternalAxiosRequestConfig): InternalAxiosRequestConfig {
  const accessToken = getSessionToken();

  if (accessToken !== null && config.headers.get('Authorization') === undefined) {
    config.headers.set('Authorization', `Bearer ${accessToken}`);
  }

  return config;
}

/** Registra los interceptores técnicos comunes para la instancia HTTP. */
export function registerInterceptors(client: AxiosInstance) {
  client.interceptors.request.use(
    addAuthorizationHeader,
    (error: unknown) => Promise.reject(normalizeHttpError(error)),
  );

  client.interceptors.response.use(
    (response) => response,
    (error: unknown) => {
      if (isAxiosError(error) && error.response?.status === 401 && !isLoginRequest(error.config?.url)) {
        clearSessionToken();
        notifySessionUnauthorized();
      }

      return Promise.reject(normalizeHttpError(error));
    },
  );
}
