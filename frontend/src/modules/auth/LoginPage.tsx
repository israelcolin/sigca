import { materializeTheme } from '../../theme';

import { LoginForm } from './LoginForm.js';
import './styles/login.css';

/** Pantalla pública de acceso al Sistema Integral de Gestión Catequética. */
export function LoginPage() {
  return (
    <section className="login-page" aria-labelledby="login-title">
      <div className="login-page__content">
        <header className="login-page__branding">
          <div className="login-page__logos">
            <img
              className="login-page__logo"
              src="/logo-parroquia.png"
              alt={`Escudo de ${materializeTheme.parishName}`}
            />
            <img
              className="login-page__logo"
              src="/logo-catequesis.png"
              alt="Logotipo de Catequesis SIGCA"
            />
          </div>
          <p className="login-page__eyebrow">{materializeTheme.applicationName}</p>
          <h1 id="login-title" className="flow-text login-page__title">
            {materializeTheme.applicationDescription}
          </h1>
        </header>

        <article className="card z-depth-2 login-page__card">
          <div className="card-content">
            <h2>Acceso al sistema</h2>
            <p className="login-page__intro">Ingresa tus datos para continuar.</p>
            <LoginForm />
          </div>
        </article>
      </div>

      <footer className="login-page__footer">
        <span>{materializeTheme.parishName}</span>
        <span>{`${materializeTheme.applicationName} v${materializeTheme.version}`}</span>
      </footer>
    </section>
  );
}
