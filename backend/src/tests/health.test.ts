import test from 'node:test';
import assert from 'node:assert/strict';

import { createSuccessResponse } from '../core/responses/api-response.js';
import { getHealthPayload } from '../core/modules/health/health.service.js';

test('getHealthPayload devuelve información básica del sistema', () => {
  const payload = getHealthPayload();

  assert.equal(payload.system, 'SIGCA');
  assert.equal(payload.version, '0.1.0');
  assert.equal(payload.status, 'healthy');
  assert.equal(typeof payload.serverTime, 'string');
  assert.ok(payload.serverTime.length > 0);
});

test('createSuccessResponse conserva el formato estándar de la API', () => {
  const response = createSuccessResponse({ ok: true }, 'SIGCA operativo');

  assert.equal(response.success, true);
  assert.equal(response.message, 'SIGCA operativo');
  assert.deepEqual(response.meta, {});
  assert.deepEqual(response.data, { ok: true });
});
