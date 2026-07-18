import { createClient } from '@supabase/supabase-js';
import type { DatabaseClient } from './client.js';

export interface SupabaseClientConfig {
  url: string;
  anonKey: string;
}

let cachedClient: DatabaseClient | null = null;

/**
 * Crea o reutiliza una única instancia del cliente de Supabase.
 */
export function getSupabaseClient(config: SupabaseClientConfig): DatabaseClient {
  if (cachedClient !== null) {
    return cachedClient;
  }

  cachedClient = Object.assign(createClient(config.url, config.anonKey), {
    type: 'supabase' as const,
  });

  return cachedClient;
}

/**
 * Reinicia la instancia cacheada para pruebas o reconfiguraciones.
 */
export function resetSupabaseClient(): void {
  cachedClient = null;
}
