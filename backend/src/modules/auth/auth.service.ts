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
