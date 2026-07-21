import type { Session, User } from '@supabase/supabase-js';

import { env } from '../../core/config/env.js';
import { getSupabaseClient } from '../../core/database/index.js';
import {
  createErrorResponse,
  createSuccessResponse,
  type ApiResponse,
} from '../../shared/responses/api-response.js';

export interface LoginCredentials {
  email: string;
  password: string;
}

export interface AuthLoginData {
  user: User | null;
  session: Session | null;
}

export type AuthLoginResponse = ApiResponse<AuthLoginData>;
export type AuthLogoutResponse = ApiResponse<null>;
export type AuthRegistrationResponse = ApiResponse<AuthLoginData>;
export type PasswordRecoveryResponse = ApiResponse<null>;

export interface PasswordRecoveryRequest {
  email: string;
}

function getAuthClient() {
  return getSupabaseClient({
    url: env.supabase.url,
    anonKey: env.supabase.anonKey,
  });
}

/**
 * Autentica al usuario mediante Supabase Auth.
 */
export async function login(credentials: LoginCredentials): Promise<AuthLoginResponse> {
  const { data, error } = await getAuthClient().auth.signInWithPassword(credentials);

  if (error !== null) {
    if (error.code === 'invalid_credentials') {
      return createErrorResponse('Credenciales inválidas');
    }

    throw error;
  }

  return createSuccessResponse(
    {
      user: data.user,
      session: data.session,
    },
    'Inicio de sesión exitoso',
  );
}

/**
 * Registra un usuario mediante Supabase Auth.
 */
export async function register(
  credentials: LoginCredentials,
): Promise<AuthRegistrationResponse> {
  const { data, error } = await getAuthClient().auth.signUp(credentials);

  if (error !== null) {
    if (error.code === 'user_already_exists') {
      return createErrorResponse('El usuario ya está registrado');
    }

    throw error;
  }

  if (data.user?.identities?.length === 0) {
    return createErrorResponse('El usuario ya está registrado');
  }

  return createSuccessResponse(
    {
      user: data.user,
      session: data.session,
    },
    'Usuario registrado exitosamente',
  );
}

/**
 * Solicita a Supabase el envío del correo de recuperación de contraseña.
 */
export async function requestPasswordRecovery(
  request: PasswordRecoveryRequest,
): Promise<PasswordRecoveryResponse> {
  const { error } = await getAuthClient().auth.resetPasswordForEmail(request.email);

  if (error !== null) {
    throw error;
  }

  return createSuccessResponse(null, 'Solicitud de recuperación enviada');
}

/**
 * Cierra la sesión activa mediante Supabase Auth.
 */
export async function logout(): Promise<AuthLogoutResponse> {
  const { error } = await getAuthClient().auth.signOut();

  if (error !== null) {
    throw error;
  }

  return createSuccessResponse(null, 'Sesión cerrada exitosamente');
}
