import { useEffect, useRef, useState, type FormEvent } from 'react';

import { toAuthenticatedUser, useAuth } from '../../auth';
import { HttpClientError } from '../../api';
import { authService } from '../../services/auth';
import { updateMaterializeTextFields } from '../../theme';

const invalidCredentialsMessage = 'Usuario o contraseña incorrectos.';
const connectionErrorMessage = 'No fue posible conectar con el servidor. Intenta nuevamente.';
const incompleteProfileMessage = 'No fue posible completar el acceso a tu cuenta.';
const unexpectedErrorMessage = 'Ocurrió un error inesperado. Intenta nuevamente.';

function getErrorMessage(error: unknown): string {
  if (!(error instanceof HttpClientError)) {
    return unexpectedErrorMessage;
  }

  if (error.status === 401) {
    return invalidCredentialsMessage;
  }

  if (error.status === 403) {
    return incompleteProfileMessage;
  }

  if (error.status === null) {
    return connectionErrorMessage;
  }

  return unexpectedErrorMessage;
}

/** Formulario institucional de acceso conectado con el servicio de autenticación. */
export function LoginForm() {
  const { setAuthenticatedUser } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');
  const isSubmittingRef = useRef(false);

  useEffect(() => {
    updateMaterializeTextFields();
  }, [email, password]);

  const updateEmail = (value: string) => {
    setEmail(value);
    setErrorMessage('');
  };

  const updatePassword = (value: string) => {
    setPassword(value);
    setErrorMessage('');
  };

  const submitLogin = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    if (isSubmittingRef.current) {
      return;
    }

    const normalizedEmail = email.trim();

    if (normalizedEmail.length === 0 || password.length === 0) {
      setErrorMessage('Usuario y contraseña son obligatorios.');
      return;
    }

    isSubmittingRef.current = true;
    setIsSubmitting(true);
    setErrorMessage('');

    try {
      const response = await authService.login({ email: normalizedEmail, password });

      if (!response.success) {
        setErrorMessage(invalidCredentialsMessage);
        return;
      }

      const authenticatedUser = toAuthenticatedUser(response.data.user);

      setAuthenticatedUser(authenticatedUser);
    } catch (error) {
      setErrorMessage(getErrorMessage(error));
    } finally {
      isSubmittingRef.current = false;
      setIsSubmitting(false);
    }
  };

  return (
    <form className="login-form" noValidate onSubmit={submitLogin}>
      <div className="input-field">
        <i className="material-icons prefix" aria-hidden="true">
          person_outline
        </i>
        <input
          id="username"
          name="username"
          type="text"
          value={email}
          autoComplete="username"
          disabled={isSubmitting}
          onChange={(event) => updateEmail(event.target.value)}
        />
        <label htmlFor="username">Usuario</label>
      </div>

      <div className="input-field">
        <i className="material-icons prefix" aria-hidden="true">
          lock_outline
        </i>
        <input
          id="password"
          name="password"
          type="password"
          value={password}
          autoComplete="current-password"
          disabled={isSubmitting}
          onChange={(event) => updatePassword(event.target.value)}
        />
        <label htmlFor="password">Contraseña</label>
      </div>

      {errorMessage.length > 0 && (
        <p className="helper-text login-form__message" role="alert">
          {errorMessage}
        </p>
      )}

      <button
        className="btn waves-effect waves-light login-form__submit"
        type="submit"
        disabled={isSubmitting}
      >
        {isSubmitting ? 'Ingresando...' : 'Iniciar Sesión'}
        {isSubmitting ? (
          <span className="preloader-wrapper small active login-form__spinner" aria-hidden="true">
            <span className="spinner-layer spinner-white-only">
              <span className="circle-clipper left">
                <span className="circle" />
              </span>
              <span className="gap-patch">
                <span className="circle" />
              </span>
              <span className="circle-clipper right">
                <span className="circle" />
              </span>
            </span>
          </span>
        ) : (
          <i className="material-icons right" aria-hidden="true">
            login
          </i>
        )}
      </button>
    </form>
  );
}
