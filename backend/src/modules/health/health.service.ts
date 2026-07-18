/**
 * Servicio de salud del sistema.
 */
import { config } from '../../core/config/config.js';
import { getSystemMetadata } from '../../core/version/version.js';

export interface HealthPayload {
  system: string;
  version: string;
  environment: string;
  serverTime: string;
  status: 'healthy';
}

/**
 * Construye el payload de salud del sistema.
 */
export function getHealthPayload(): HealthPayload {
  return {
    system: getSystemMetadata().system,
    version: getSystemMetadata().version,
    environment: config.nodeEnv,
    serverTime: new Date().toISOString(),
    status: 'healthy',
  };
}
