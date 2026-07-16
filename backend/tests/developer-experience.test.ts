import test from 'node:test';
import assert from 'node:assert/strict';

import { buildStartupBanner, buildWelcomePage } from '../core/modules/welcome/welcome.service.js';

test('buildWelcomePage incluye la información base del sistema', () => {
  const page = buildWelcomePage({
    systemName: 'SIGCA',
    systemVersion: '0.1.0',
    environment: 'development',
    port: '3000',
    healthPath: '/api/v1/health',
    startedAt: '2026-07-06 18:30:00',
  });

  assert.match(page, /SIGCA/);
  assert.match(page, /Sistema Integral de Gestión Catequética/);
  assert.match(page, /Servidor funcionando correctamente/);
  assert.match(page, /\/api\/v1\/health/);
});

test('buildStartupBanner incluye versión, ambiente, puerto y URLs', () => {
  const banner = buildStartupBanner({
    systemName: 'SIGCA',
    systemVersion: '0.1.0',
    environment: 'development',
    port: '3000',
    healthPath: '/api/v1/health',
    startedAt: '2026-07-06 18:30:00',
  });

  assert.match(banner, /Versión:/);
  assert.match(banner, /0\.1\.0/);
  assert.match(banner, /Ambiente:/);
  assert.match(banner, /development/);
  assert.match(banner, /Puerto:/);
  assert.match(banner, /3000/);
  assert.match(banner, /Health:/);
});
