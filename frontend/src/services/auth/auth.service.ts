import { apiClient } from '../../api/index.js';
import { setSessionToken } from '../../storage/index.js';

import type {
  LoginRequest,
  LoginResponse,
  LogoutResponse,
  SessionResponse,
} from './auth.types.js';

/** Encapsula las solicitudes HTTP correspondientes a autenticación. */
export const authService = {
  async login(credentials: LoginRequest): Promise<LoginResponse> {
    const response = await apiClient.post<LoginResponse>('auth/login', credentials);

    if (response.data.success) {
      setSessionToken(response.data.data.session.access_token);
    }

    return response.data;
  },

  async getSession(): Promise<SessionResponse> {
    const response = await apiClient.get<SessionResponse>('auth/session');

    return response.data;
  },

  async logout(): Promise<LogoutResponse> {
    const response = await apiClient.post<LogoutResponse>('auth/logout');

    return response.data;
  },
};
