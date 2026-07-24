import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min.js';

interface MaterializeApi {
  updateTextFields(): void;
}

declare global {
  interface Window {
    M?: MaterializeApi;
  }
}

/** Configuración visual institucional compartida por la aplicación. */
export const materializeTheme = {
  applicationName: 'SIGCA',
  applicationDescription: 'Sistema Integral de Gestión Catequética',
  parishName: 'Parroquia de la Santísima Trinidad',
  version: '0.1.0',
  colors: {
    primary: '#1565C0',
    primaryDark: '#0D47A1',
    secondary: '#42A5F5',
    surface: '#FFFFFF',
    background: '#F5F7FA',
    textPrimary: '#263238',
    textSecondary: '#607D8B',
    divider: '#CFD8DC',
    danger: '#D32F2F',
    overlay: 'rgb(38 50 56 / 40%)',
    elevation: 'rgb(38 50 56 / 24%)',
  },
  spacing: {
    xs: '4px',
    sm: '8px',
    md: '16px',
    lg: '24px',
    xl: '32px',
    xxl: '48px',
    xxxl: '64px',
  },
  radii: {
    small: '4px',
    medium: '8px',
    large: '12px',
    card: '16px',
    pill: '999px',
  },
  typography: {
    titleWeight: '500',
    textWeight: '400',
    buttonWeight: '500',
    brandTitleSize: '2rem',
    systemTitleSize: '1.25rem',
    cardTitleSize: '1.5rem',
  },
  dimensions: {
    inputHeight: '48px',
    loginCardMaxWidth: '420px',
    topBarHeight: '64px',
    sideNavWidth: '272px',
    avatarSmall: '40px',
    avatarMedium: '48px',
    avatarLarge: '64px',
  },
} as const;

/** Aplica las variables visuales institucionales a los estilos globales. */
export function initializeMaterializeTheme() {
  const rootStyle = document.documentElement.style;

  Object.entries(materializeTheme).forEach(([group, values]) => {
    if (typeof values !== 'object') {
      return;
    }

    Object.entries(values).forEach(([name, value]) => {
      const tokenName = `${group}-${name}`.replace(/[A-Z]/g, (letter) =>
        `-${letter.toLowerCase()}`,
      );

      rootStyle.setProperty(`--sigca-${tokenName}`, value);
    });
  });
}

/** Sincroniza los labels de los campos de Materialize ya renderizados. */
export function updateMaterializeTextFields() {
  window.M?.updateTextFields();
}
