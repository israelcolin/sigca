import { createContext } from 'react';

import type { AuthContextValue } from './types.js';

/** Contexto interno que mantiene el estado global de autenticación. */
export const AuthContext = createContext<AuthContextValue | undefined>(undefined);
