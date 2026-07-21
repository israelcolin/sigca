import { createClient as createSupabaseJsClient } from '@supabase/supabase-js';
import type { DatabaseClient } from './client.js';

export interface SupabaseClientConfig {
  url: string;
  anonKey: string;
}

export interface RequestSupabaseClientConfig extends SupabaseClientConfig {
  accessToken: string;
}

let cachedClient: DatabaseClient | null = null;

function createClient(config: SupabaseClientConfig, accessToken?: string): DatabaseClient {
  return Object.assign(
    createSupabaseJsClient(config.url, config.anonKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
        detectSessionInUrl: false,
      },
      ...(accessToken === undefined
        ? {}
        : {
            accessToken: async () => accessToken,
          }),
    }),
    {
      type: 'supabase' as const,
    },
  );
}

/**
 * Crea o reutiliza una única instancia del cliente de Supabase.
 */
export function getSupabaseClient(config: SupabaseClientConfig): DatabaseClient {
  if (cachedClient !== null) {
    return cachedClient;
  }

  cachedClient = createClient(config);

  return cachedClient;
}

/**
 * Crea un cliente aislado para el contexto de una solicitud autenticada.
 */
export function createRequestSupabaseClient(
  config: RequestSupabaseClientConfig,
): DatabaseClient {
  return createClient(config, config.accessToken);
}

/**
 * Reinicia la instancia cacheada para pruebas o reconfiguraciones.
 */
export function resetSupabaseClient(): void {
  cachedClient = null;
}
