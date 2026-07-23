import type { PropsWithChildren } from 'react';

interface PageContainerProps extends PropsWithChildren {
  className?: string;
}

/**
 * Contenedor semántico reutilizable para el contenido principal de una página.
 */
export function PageContainer({ children, className }: PageContainerProps) {
  return (
    <main className={className} aria-live="polite">
      {children}
    </main>
  );
}
