import { Outlet } from 'react-router-dom';

/** Contenedor mínimo para las rutas que requieren una sesión autenticada. */
export default function PrivateLayout() {
  return <Outlet />;
}
