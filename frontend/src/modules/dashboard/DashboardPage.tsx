import { useAuth } from '../../auth/index.js';
import './styles/dashboard.css';

/** Contenido inicial del Dashboard dentro del layout principal. */
export function DashboardPage() {
  const { authenticatedUser } = useAuth();
  const userName = authenticatedUser?.nombre ?? 'Usuario';
  const userRole = authenticatedUser?.rol || 'Sin rol asignado';

  return (
    <section className="dashboard-page" aria-labelledby="dashboard-title">
      <article className="card z-depth-2 dashboard-page__card">
        <div className="card-content">
          <p className="dashboard-page__brand">SIGCA</p>
          <h1 id="dashboard-title">Dashboard</h1>
          <p className="dashboard-page__welcome">Bienvenido, {userName}</p>
          <p className="dashboard-page__role">Rol activo: {userRole}</p>
        </div>
      </article>
    </section>
  );
}
