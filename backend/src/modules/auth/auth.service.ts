import type { Session, User } from '@supabase/supabase-js';

import { env } from '../../core/config/env.js';
import {
  createRequestSupabaseClient,
  getSupabaseClient,
  type DatabaseClient,
} from '../../core/database/index.js';
import {
  createErrorResponse,
  createSuccessResponse,
  type ApiResponse,
} from '../../shared/responses/api-response.js';

export interface LoginCredentials {
  email: string;
  password: string;
}

export interface AuthenticatedLoginUser {
  id: string;
  name: string;
  role: string;
  email?: string;
}

export interface AuthLoginData {
  user: AuthenticatedLoginUser;
  session: Session;
}

export interface AuthRegistrationData {
  user: User | null;
  session: Session | null;
}

export type AuthLoginResponse = ApiResponse<AuthLoginData>;
export type AuthSessionResponse = ApiResponse<AuthenticatedLoginUser>;
export type AuthLogoutResponse = ApiResponse<null>;
export type AuthRegistrationResponse = ApiResponse<AuthRegistrationData>;
export type PasswordRecoveryResponse = ApiResponse<null>;

export interface PasswordRecoveryRequest {
  email: string;
}

interface ProfileRecord {
  nombre: string;
  apellido_paterno: string;
  apellido_materno: string | null;
}

interface UserRecord {
  id: string;
}

interface UserRoleRecord {
  cat_roles: {
    activo: boolean;
    codigo: string;
  } | null;
}

function getAuthClient() {
  return getSupabaseClient({
    url: env.supabase.url,
    anonKey: env.supabase.anonKey,
  });
}

function formatName(profile: ProfileRecord): string {
  return [profile.nombre, profile.apellido_paterno, profile.apellido_materno]
    .filter((value): value is string => value !== null && value.trim().length > 0)
    .join(' ');
}

async function resolveAuthenticatedUser(
  user: User,
  authClient: DatabaseClient,
): Promise<AuthenticatedLoginUser | null> {
  const [userResult, profileResult, rolesResult] = await Promise.all([
    authClient
      .from('usuario')
      .select('id')
      .eq('id', user.id)
      .maybeSingle<UserRecord>(),
    authClient
      .from('perfil')
      .select('nombre, apellido_paterno, apellido_materno')
      .eq('usuario_id', user.id)
      .maybeSingle<ProfileRecord>(),
    authClient
      .from('usuario_rol')
      .select('cat_roles!inner(codigo, activo)')
      .eq('usuario_id', user.id)
      .eq('cat_roles.activo', true)
      .returns<UserRoleRecord[]>(),
  ]);

  if (userResult.error !== null) {
    throw userResult.error;
  }

  if (profileResult.error !== null) {
    throw profileResult.error;
  }

  if (rolesResult.error !== null) {
    throw rolesResult.error;
  }

  const profile = profileResult.data;
  const roles = rolesResult.data ?? [];
  const [roleAssignment] = roles;
  const name = profile === null ? null : formatName(profile);

  if (
    userResult.data === null ||
    profile === null ||
    name === null ||
    name.length === 0 ||
    roles.length !== 1 ||
    roleAssignment === undefined ||
    roleAssignment.cat_roles === null
  ) {
    return null;
  }

  return {
    id: user.id,
    name,
    role: roleAssignment.cat_roles.codigo,
    ...(user.email === undefined ? {} : { email: user.email }),
  };
}

function createIncompleteProfileResponse<T>(): ApiResponse<T> {
  return createErrorResponse(
    'No fue posible completar el acceso a tu cuenta.',
    ['El perfil o rol de la cuenta no está completo.'],
    { code: 'AUTH_PROFILE_INCOMPLETE' },
  );
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

  if (data.user === null || data.session === null) {
    return createIncompleteProfileResponse<AuthLoginData>();
  }

  const requestAuthClient = createRequestSupabaseClient({
    url: env.supabase.url,
    anonKey: env.supabase.anonKey,
    accessToken: data.session.access_token,
  });
  const authenticatedUser = await resolveAuthenticatedUser(data.user, requestAuthClient);

  if (authenticatedUser === null) {
    return createIncompleteProfileResponse<AuthLoginData>();
  }

  return createSuccessResponse(
    {
      user: authenticatedUser,
      session: data.session,
    },
    'Inicio de sesión exitoso',
  );
}

/**
 * Obtiene el usuario normalizado de una sesión previamente validada.
 */
export async function getSession(
  user: User,
  authClient: DatabaseClient,
): Promise<AuthSessionResponse> {
  const authenticatedUser = await resolveAuthenticatedUser(user, authClient);

  if (authenticatedUser === null) {
    return createIncompleteProfileResponse<AuthenticatedLoginUser>();
  }

  return createSuccessResponse(authenticatedUser, 'Sesión válida');
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
