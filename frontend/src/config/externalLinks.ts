/** Enlace externo configurable para el pie de página institucional. */
export interface ExternalLink {
  label: string;
  url: string;
  icon?: string;
}

/**
 * Los enlaces institucionales se agregarán cuando sus URL oficiales estén disponibles.
 */
export const externalLinks: readonly ExternalLink[] = [];
