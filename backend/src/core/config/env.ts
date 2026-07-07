import { readFileSync, existsSync } from 'node:fs';
import { resolve } from 'node:path';

export interface AppEnv {
  app: {
    name: string;
    version: string;
  };
  server: {
    port: string;
    environment: string;
  };
  supabase: {
    url: string;
    anonKey: string;
  };
}

export interface EnvInput {
  APP_NAME?: string | undefined;
  APP_VERSION?: string | undefined;
  NODE_ENV?: string | undefined;
  PORT?: string | undefined;
  SUPABASE_URL?: string | undefined;
  SUPABASE_ANON_KEY?: string | undefined;
}

const requiredKeys = ['APP_NAME', 'APP_VERSION', 'NODE_ENV', 'PORT', 'SUPABASE_URL', 'SUPABASE_ANON_KEY'] as const;

function readEnvFile(): EnvInput {
  const candidates = [
    resolve(process.cwd(), 'backend', '.env.development'),
    resolve(process.cwd(), '.env.development'),
  ];

  for (const candidate of candidates) {
    if (!existsSync(candidate)) {
      continue;
    }

    const content = readFileSync(candidate, 'utf8');
    const values: EnvInput = {};

    for (const line of content.split(/\r?\n/)) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith('#')) {
        continue;
      }

      const separatorIndex = trimmed.indexOf('=');
      if (separatorIndex === -1) {
        continue;
      }

      const key = trimmed.slice(0, separatorIndex).trim();
      const rawValue = trimmed.slice(separatorIndex + 1).trim();
      const value = rawValue.replace(/^['"]|['"]$/g, '');
      values[key as keyof EnvInput] = value;
    }

    return values;
  }

  return {};
}

/**
 * Construye el objeto env a partir de un mapa de valores.
 */
export function buildEnv(values: EnvInput = {}): AppEnv {
  return {
    app: {
      name: values.APP_NAME ?? '',
      version: values.APP_VERSION ?? '',
    },
    server: {
      port: values.PORT ?? '3000',
      environment: values.NODE_ENV ?? 'development',
    },
    supabase: {
      url: values.SUPABASE_URL ?? '',
      anonKey: values.SUPABASE_ANON_KEY ?? '',
    },
  };
}

/**
 * Valida que existan todas las variables requeridas.
 */
export function validateEnv(values: EnvInput = {}): AppEnv {
  const env = buildEnv(values);
  const missing = requiredKeys.filter((key) => {
    const value = values[key];
    return value === undefined || value.trim() === '';
  });

  if (missing.length > 0) {
    throw new Error(`Variables de entorno faltantes: ${missing.join(', ')}`);
  }

  return env;
}

/**
 * Recupera las variables de entorno del proceso y las valida.
 */
export function loadEnv(): AppEnv {
  const fileValues = readEnvFile();
  const values = {
    APP_NAME: process.env.APP_NAME ?? fileValues.APP_NAME,
    APP_VERSION: process.env.APP_VERSION ?? fileValues.APP_VERSION,
    NODE_ENV: process.env.NODE_ENV ?? fileValues.NODE_ENV,
    PORT: process.env.PORT ?? fileValues.PORT,
    SUPABASE_URL: process.env.SUPABASE_URL ?? fileValues.SUPABASE_URL,
    SUPABASE_ANON_KEY: process.env.SUPABASE_ANON_KEY ?? fileValues.SUPABASE_ANON_KEY,
  };

  const normalizedNodeEnv = values.NODE_ENV ?? 'development';

  if (normalizedNodeEnv === 'test' || normalizedNodeEnv === 'development') {
    return buildEnv({
      ...values,
      APP_NAME: values.APP_NAME ?? 'SIGCA',
      APP_VERSION: values.APP_VERSION ?? '0.1.0',
      NODE_ENV: normalizedNodeEnv,
      PORT: values.PORT ?? '3000',
      SUPABASE_URL: values.SUPABASE_URL ?? 'https://example.supabase.co',
      SUPABASE_ANON_KEY: values.SUPABASE_ANON_KEY ?? 'development-anon-key',
    });
  }

  return validateEnv(values);
}

export const env = loadEnv();
