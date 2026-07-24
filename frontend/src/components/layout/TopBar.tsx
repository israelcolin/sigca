import { useRef, useState } from 'react';

import { useAuth } from '../../auth/index.js';
import { UserAvatar } from './UserAvatar.js';

interface TopBarProps {
  isMenuOpen: boolean;
  onMenuToggle: () => void;
}

/** Barra superior de las rutas privadas de SIGCA. */
export function TopBar({ isMenuOpen, onMenuToggle }: TopBarProps) {
  const { authenticatedUser, logout } = useAuth();
  const [isLoggingOut, setIsLoggingOut] = useState(false);
  const isLoggingOutRef = useRef(false);
  const userName = authenticatedUser?.nombre ?? 'Usuario';
  const userRole = authenticatedUser?.rol || 'Sin rol asignado';

  const handleLogout = async () => {
    if (isLoggingOutRef.current) {
      return;
    }

    isLoggingOutRef.current = true;
    setIsLoggingOut(true);

    try {
      await logout();
    } catch {
      // AuthProvider limpia la sesión local incluso si el cierre remoto falla.
    } finally {
      isLoggingOutRef.current = false;
      setIsLoggingOut(false);
    }
  };

  return (
    <header className="top-bar">
      <div className="top-bar__brand">
        <button
          className="top-bar__menu-button"
          type="button"
          aria-label="Abrir menú de navegación"
          aria-expanded={isMenuOpen}
          onClick={onMenuToggle}
        >
          <i className="material-icons" aria-hidden="true">
            menu
          </i>
        </button>
        <span className="top-bar__title">SIGCA</span>
      </div>

      <div className="top-bar__user">
        <UserAvatar name={userName} photoUrl={authenticatedUser?.photoUrl} />
        <div className="top-bar__identity">
          <span className="top-bar__name">{userName}</span>
          <span className="top-bar__role">{userRole}</span>
        </div>
        <button
          className="top-bar__logout"
          type="button"
          aria-label="Cerrar sesión"
          disabled={isLoggingOut}
          onClick={() => void handleLogout()}
        >
          <span className="top-bar__logout-label">
            {isLoggingOut ? 'Cerrando…' : 'Cerrar sesión'}
          </span>
          <i className="material-icons" aria-hidden="true">
            logout
          </i>
        </button>
      </div>
    </header>
  );
}
