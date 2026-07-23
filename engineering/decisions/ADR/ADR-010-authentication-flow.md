# ADR-010

## Decisión

Se adopta autenticación basada en JWT Bearer administrado por el Frontend.

## Razones

- Compatible con Supabase.
- Backend stateless.
- Fácil integración con Axios.

## Persistencia

sessionStorage

## Restauración

GET /auth/session

## Rutas

ProtectedRoute
PublicRoute

## Logout

Siempre limpia la sesión local mediante finally.