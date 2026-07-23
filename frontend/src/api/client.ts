import axios from 'axios';

import { registerInterceptors } from './interceptors.js';
import { HTTP_TIMEOUT_MS } from './types.js';

const apiBaseUrl = import.meta.env.VITE_API_BASE_URL;

if (typeof apiBaseUrl !== 'string' || apiBaseUrl.length === 0) {
  throw new Error('VITE_API_BASE_URL debe estar definida.');
}

/** Instancia única autorizada para comunicarse con la API de SIGCA. */
export const apiClient = axios.create({
  baseURL: apiBaseUrl,
  timeout: HTTP_TIMEOUT_MS,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
});

registerInterceptors(apiClient);
