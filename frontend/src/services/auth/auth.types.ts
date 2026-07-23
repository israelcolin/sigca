import type { ApiResponse } from '../../api/index.js';

/** Credenciales aceptadas por el endpoint público de inicio de sesión. */
export interface LoginRequest {
  email: string;
  password: string;
}

/** Usuario autenticado normalizado por el Backend. */
export interface LoginUser {
  id: string;
  name: string;
  role: string;
  email?: string;
}

/** Información pública de sesión devuelta por Supabase a través del Backend. */
export interface LoginSession {
  access_token: string;
  token_type: string;
  expires_in: number;
  expires_at?: number;
  refresh_token: string;
  user: unknown;
  [key: string]: unknown;
}

/** Datos del inicio de sesión definidos por la respuesta pública del Backend. */
export interface LoginData {
  user: LoginUser;
  session: LoginSession;
}

/** Respuesta estándar del endpoint `POST /auth/login`. */
export type LoginResponse = ApiResponse<LoginData>;

/** Respuesta estándar del endpoint `GET /auth/session`. */
export type SessionResponse = ApiResponse<LoginUser>;

/** Respuesta estándar del endpoint `POST /auth/logout`. */
export type LogoutResponse = ApiResponse<null>;
