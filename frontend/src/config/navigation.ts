/** Opción de navegación disponible dentro de las rutas privadas. */
export interface NavigationItem {
  label: string;
  icon: string;
  path: string;
  enabled: boolean;
}

/** Configuración centralizada de los módulos visibles en la navegación principal. */
export const navigationItems: readonly NavigationItem[] = [
  { label: 'Dashboard', icon: 'dashboard', path: '/dashboard', enabled: true },
  { label: 'Usuarios', icon: 'people', path: '/usuarios', enabled: true },
  { label: 'Catequistas', icon: 'school', path: '/catequistas', enabled: true },
  { label: 'Alumnos', icon: 'groups', path: '/alumnos', enabled: true },
  { label: 'Grupos', icon: 'group_work', path: '/grupos', enabled: true },
  { label: 'Asistencias', icon: 'fact_check', path: '/asistencias', enabled: true },
  { label: 'Reportes', icon: 'assessment', path: '/reportes', enabled: true },
  { label: 'Configuración', icon: 'settings', path: '/configuracion', enabled: true },
];
