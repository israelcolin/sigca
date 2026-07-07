/**
 * Metadatos compartidos del sistema SIGCA.
 */
export const systemName = 'SIGCA';
export const systemVersion = '0.1.0';

export interface SystemMetadata {
  system: string;
  version: string;
}

/**
 * Recupera la metadata textual básica del sistema.
 */
export function getSystemMetadata(): SystemMetadata {
  return {
    system: systemName,
    version: systemVersion,
  };
}
