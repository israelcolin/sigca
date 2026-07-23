type SessionUnauthorizedListener = () => void;

const unauthorizedListeners = new Set<SessionUnauthorizedListener>();

/** Registra una reacción al vencimiento o invalidez de una sesión HTTP. */
export function subscribeToSessionUnauthorized(
  listener: SessionUnauthorizedListener,
): () => void {
  unauthorizedListeners.add(listener);

  return () => unauthorizedListeners.delete(listener);
}

/** Notifica al estado de autenticación sin acoplar el cliente HTTP a React. */
export function notifySessionUnauthorized(): void {
  unauthorizedListeners.forEach((listener) => listener());
}
