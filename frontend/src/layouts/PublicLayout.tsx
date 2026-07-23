import { Outlet } from 'react-router-dom';

import { PageContainer } from '../shared';

/**
 * Estructura base reutilizable para todas las pantallas públicas.
 */
export default function PublicLayout() {
  return (
    <div className="public-layout">
      <PageContainer className="public-layout__content">
        <Outlet />
      </PageContainer>
    </div>
  );
}
