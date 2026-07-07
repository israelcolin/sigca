import test from 'node:test';
import assert from 'node:assert/strict';

import { buildEnv, validateEnv } from '../core/config/env.js';
import { getSupabaseClient, resetSupabaseClient } from '../core/database/supabase-client.js';

test('buildEnv agrega los valores esperados desde el entorno', () => {
  const env = buildEnv({
    APP_NAME: 'SIGCA',
    APP_VERSION: '0.1.0',
    NODE_ENV: 'test',
    PORT: '3000',
    SUPABASE_URL: 'https://example.supabase.co',
    SUPABASE_ANON_KEY: 'anon-key',
  });

  assert.equal(env.app.name, 'SIGCA');
  assert.equal(env.app.version, '0.1.0');
  assert.equal(env.server.port, '3000');
  assert.equal(env.supabase.url, 'https://example.supabase.co');
  assert.equal(env.supabase.anonKey, 'anon-key');
});

test('validateEnv rechaza variables obligatorias faltantes', () => {
  assert.throws(() => {
    validateEnv({
      APP_NAME: 'SIGCA',
      APP_VERSION: '0.1.0',
      NODE_ENV: 'test',
      PORT: '3000',
      SUPABASE_URL: '',
      SUPABASE_ANON_KEY: 'anon-key',
    });
  }, /SUPABASE_URL/);
});

test('getSupabaseClient devuelve una única instancia', () => {
  resetSupabaseClient();
  const first = getSupabaseClient({
    url: 'https://example.supabase.co',
    anonKey: 'anon-key',
  });
  const second = getSupabaseClient({
    url: 'https://example.supabase.co',
    anonKey: 'anon-key',
  });

  assert.strictEqual(first, second);
});
