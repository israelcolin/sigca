import { useRef, useState } from 'react';

import { useAuth } from '../../auth/index.js';
import './styles/dashboard.css';

/** Pantalla temporal que confirma el acceso a una ruta privada. */
export function DashboardPage() {
  const { authenticatedUser, logout } = useAuth();
  const [isLoggingOut, setIsLoggingOut] = useState(false);
  const isLoggingOutRef = useRef(false);

  const handleLogout = async () => {
    if (isLoggingOutRef.current) {
      return;
    }

    isLoggingOutRef.current = true;
    setIsLoggingOut(true);

    try {
      await logout();
    } catch {
      // La limpieza local se ejecuta en AuthProvider incluso si falla la API.
    } finally {
      isLoggingOutRef.current = false;
      setIsLoggingOut(false);
    }
  };

  return (
    <main className="dashboard-page">
      <article className="card z-depth-2 dashboard-page__card">
        <div className="card-content">
          <p className="dashboard-page__brand">SIGCA</p>
          <h1>Dashboard</h1>
          <p className="dashboard-page__welcome">
            Bienvenido, {authenticatedUser?.nombre ?? ''}
          </p>
          <p className="dashboard-page__role">Rol: {authenticatedUser?.rol ?? ''}</p>
        </div>
        <div className="card-action dashboard-page__actions">
          <button
            className="btn waves-effect waves-light dashboard-page__logout"
            type="button"
            disabled={isLoggingOut}
            onClick={() => void handleLogout()}
          >
            {isLoggingOut ? 'Cerrando sesión…' : 'Cerrar sesión'}
            <i className="material-icons right" aria-hidden="true">
              logout
            </i>
          </button>
        </div>
      </article>
    </main>
  );
}
