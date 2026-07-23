/** Indicador neutral mostrado mientras se restaura la sesión autenticada. */
export function AuthLoading() {
  return (
    <main className="auth-loading" aria-busy="true" aria-label="Validando sesión">
      <div className="preloader-wrapper big active" role="status">
        <div className="spinner-layer auth-loading__spinner">
          <div className="circle-clipper left">
            <div className="circle" />
          </div>
          <div className="gap-patch">
            <div className="circle" />
          </div>
          <div className="circle-clipper right">
            <div className="circle" />
          </div>
        </div>
      </div>
      <span className="auth-loading__label">Validando sesión…</span>
    </main>
  );
}
