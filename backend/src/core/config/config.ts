export interface AppConfig {
  nodeEnv: string;
  port: string;
  apiVersion: string;
  systemName: string;
  systemVersion: string;
  corsOrigin: string;
}

const env = process.env;

/**
 * Configuración centralizada del backend.
 */
export const config: AppConfig = {
  nodeEnv: env.NODE_ENV ?? 'development',
  port: env.PORT ?? '3000',
  apiVersion: 'v1',
  systemName: env.APP_NAME ?? 'SIGCA',
  systemVersion: env.APP_VERSION ?? '0.1.0',
  corsOrigin: env.CORS_ORIGIN ?? 'http://localhost:5173',
};
