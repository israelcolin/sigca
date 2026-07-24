import { useEffect, useState } from 'react';

export interface UserAvatarProps {
  name: string;
  photoUrl?: string | null;
  size?: 'small' | 'medium' | 'large';
}

/** Avatar reutilizable con fallback seguro a un ícono institucional. */
export function UserAvatar({ name, photoUrl, size = 'small' }: UserAvatarProps) {
  const [hasImageError, setHasImageError] = useState(false);

  useEffect(() => {
    setHasImageError(false);
  }, [photoUrl]);

  const shouldRenderImage = photoUrl !== undefined && photoUrl !== null && !hasImageError;

  if (!shouldRenderImage) {
    return (
      <span
        className={`user-avatar user-avatar--${size}`}
        role="img"
        aria-label={`Avatar predeterminado de ${name}`}
      >
        <i className="material-icons" aria-hidden="true">
          account_circle
        </i>
      </span>
    );
  }

  return (
    <span className={`user-avatar user-avatar--${size}`}>
      <img src={photoUrl} alt={`Fotografía de ${name}`} onError={() => setHasImageError(true)} />
    </span>
  );
}
