import type { SupabaseClient } from '@supabase/supabase-js';

/**
 * Contrato base para el acceso a la base de datos del Core.
 *
 * Este módulo no implementa lógica de negocio ni consultas. Su propósito es
 * establecer el punto de entrada reutilizable para futuros módulos.
 */
export interface DatabaseClient extends SupabaseClient {
  readonly type: 'supabase';
}
