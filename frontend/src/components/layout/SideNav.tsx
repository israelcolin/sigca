import { NavLink } from 'react-router-dom';

import { navigationItems } from '../../config/navigation.js';

interface SideNavProps {
  isOpen: boolean;
  onClose: () => void;
}

/** Navegación principal responsiva de las rutas privadas. */
export function SideNav({ isOpen, onClose }: SideNavProps) {
  return (
    <>
      <button
        className={`side-nav__backdrop${isOpen ? ' side-nav__backdrop--visible' : ''}`}
        type="button"
        aria-label="Cerrar menú de navegación"
        tabIndex={isOpen ? 0 : -1}
        onClick={onClose}
      />
      <nav
        className={`side-nav${isOpen ? ' side-nav--open' : ''}`}
        aria-label="Navegación principal"
      >
        <div className="side-nav__header">
          <span>Navegación</span>
          <button
            className="side-nav__close-button"
            type="button"
            aria-label="Cerrar menú de navegación"
            onClick={onClose}
          >
            <i className="material-icons" aria-hidden="true">
              close
            </i>
          </button>
        </div>
        <ul className="side-nav__list">
          {navigationItems.map((item) => (
            <li key={item.path}>
              <NavLink
                className={({ isActive }) =>
                  `side-nav__link${isActive ? ' side-nav__link--active' : ''}`
                }
                to={item.path}
                aria-disabled={!item.enabled}
                onClick={onClose}
              >
                <i className="material-icons" aria-hidden="true">
                  {item.icon}
                </i>
                <span>{item.label}</span>
              </NavLink>
            </li>
          ))}
        </ul>
      </nav>
    </>
  );
}
