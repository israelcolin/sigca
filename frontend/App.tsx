import { RouterProvider } from 'react-router-dom';

import { appRouter } from './src/routes';

/**
 * Punto de entrada de la aplicación frontend de SIGCA.
 */
export default function App() {
  return <RouterProvider router={appRouter} />;
}
