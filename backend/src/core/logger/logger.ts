/**
 * Logger simple para el Core del backend.
 *
 * Se implementa con console para mantener el Core independiente de librerías
 * externas y facilitar un reemplazo futuro por Winston o Pino.
 */
export type LogLevel = 'info' | 'warn' | 'error';

function writeLog(level: LogLevel, message: string, metadata: unknown[] = []): void {
  const timestamp = new Date().toISOString();
  const details = metadata.length > 0 ? ` ${JSON.stringify(metadata)}` : '';
  console[level](`[${timestamp}] [${level.toUpperCase()}] ${message}${details}`);
}

export function info(message: string, ...metadata: unknown[]): void {
  writeLog('info', message, metadata);
}

export function warn(message: string, ...metadata: unknown[]): void {
  writeLog('warn', message, metadata);
}

export function error(message: string, ...metadata: unknown[]): void {
  writeLog('error', message, metadata);
}

export const logger = {
  info,
  warn,
  error,
};

export default logger;
