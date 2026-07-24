import { externalLinks } from '../../config/externalLinks.js';
import { materializeTheme } from '../../theme/index.js';

/** Pie de página institucional para las rutas privadas. */
export function AppFooter() {
  return (
    <footer className="app-footer">
      <div>
        <span>{materializeTheme.applicationName}</span>
        <span>{materializeTheme.applicationDescription}</span>
      </div>
      <div className="app-footer__meta">
        <span>Versión {materializeTheme.version}</span>
        {externalLinks.map((link) => (
          <a key={link.url} href={link.url} target="_blank" rel="noopener noreferrer">
            {link.icon !== undefined && (
              <i className="material-icons" aria-hidden="true">
                {link.icon}
              </i>
            )}
            {link.label}
          </a>
        ))}
      </div>
    </footer>
  );
}
