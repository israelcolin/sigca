import type { NextFunction, Request, Response } from 'express';
import type { User } from '@supabase/supabase-js';

import { env } from '../core/config/env.js';
import {
  createRequestSupabaseClient,
  type DatabaseClient,
} from '../core/database/index.js';
import { createErrorResponse } from '../shared/responses/api-response.js';

export interface AuthenticatedRequestContext {
  user: User;
  supabase: DatabaseClient;
}

declare global {
  namespace Express {
    interface Request {
      auth?: AuthenticatedRequestContext;
    }
  }
}

function getBearerToken(authorization: string | undefined): string | null {
  if (authorization === undefined || !authorization.startsWith('Bearer ')) {
    return null;
  }

  const token = authorization.slice('Bearer '.length).trim();

  return token.length > 0 ? token : null;
}

/**
 * Obtiene y valida la identidad de Supabase para la solicitud actual.
 */
export async function authMiddleware(
  req: Request,
  res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    const accessToken = getBearerToken(req.header('authorization'));

    if (accessToken === null) {
      res.status(401).json(createErrorResponse('No autorizado'));
      return;
    }

    const supabase = createRequestSupabaseClient({
      url: env.supabase.url,
      anonKey: env.supabase.anonKey,
      accessToken,
    });
    const { data, error } = await supabase.auth.getUser(accessToken);

    if (error !== null) {
      if (error.status === 401 || error.status === 403) {
        res.status(401).json(createErrorResponse('No autorizado'));
        return;
      }

      next(error);
      return;
    }

    if (data.user === null) {
      res.status(401).json(createErrorResponse('No autorizado'));
      return;
    }

    req.auth = {
      user: data.user,
      supabase,
    };
    next();
  } catch (error) {
    next(error);
  }
}

export default authMiddleware;
