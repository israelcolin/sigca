interface ComingSoonPageProps {
  moduleName: string;
}

/** Contenido temporal reutilizable para módulos aún no implementados. */
export function ComingSoonPage({ moduleName }: ComingSoonPageProps) {
  return (
    <section className="coming-soon-page" aria-labelledby="coming-soon-title">
      <article className="card z-depth-2 coming-soon-page__card">
        <div className="card-content">
          <h1 id="coming-soon-title">{moduleName}</h1>
          <h2>Módulo en construcción</h2>
          <p>Esta sección estará disponible en una próxima iteración.</p>
        </div>
      </article>
    </section>
  );
}
