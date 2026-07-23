import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';

import App from './App';
import { AuthProvider } from './src/auth';
import { initializeMaterializeTheme } from './src/theme';
import './src/styles/global.css';

initializeMaterializeTheme();

const rootElement = document.getElementById('root');

if (rootElement === null) {
  throw new Error('No se encontró el elemento raíz de la aplicación.');
}

createRoot(rootElement).render(
  <StrictMode>
    <AuthProvider>
      <App />
    </AuthProvider>
  </StrictMode>,
);
