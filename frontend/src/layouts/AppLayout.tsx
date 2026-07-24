import { useState } from 'react';
import { Outlet } from 'react-router-dom';

import { AppFooter, SideNav, TopBar } from '../components/layout/index.js';
import './styles/app-layout.css';

/** Estructura reutilizable para el área autenticada de SIGCA. */
export default function AppLayout() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const closeMenu = () => setIsMenuOpen(false);

  return (
    <div className="app-shell">
      <TopBar isMenuOpen={isMenuOpen} onMenuToggle={() => setIsMenuOpen((isOpen) => !isOpen)} />
      <div className="app-body">
        <SideNav isOpen={isMenuOpen} onClose={closeMenu} />
        <main className="app-content">
          <Outlet />
        </main>
      </div>
      <AppFooter />
    </div>
  );
}
