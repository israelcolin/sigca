import { env } from './env.js';
import { systemName, systemVersion } from '../version/version.js';

export interface AppConfig {
  nodeEnv: string;
  port: string;
  apiVersion: string;
  systemName: string;
  systemVersion: string;
}

/**
 * Configuración centralizada del backend.
 */
export const config: AppConfig = {
  nodeEnv: env.server.environment,
  port: env.server.port,
  apiVersion: 'v1',
  systemName: env.app.name || systemName,
  systemVersion: env.app.version || systemVersion,
};
