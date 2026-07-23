# DESIGN-003
# Design System

| Campo | Valor |
|--------|--------|
| Documento | DESIGN-003 |
| Nombre | Design System |
| Estado | Approved |
| Versión | 1.0.0 |
| Proyecto | SIGCA |
| Relacionado | DESIGN-001, DESIGN-002 |

---

# 1. Objetivo

Definir la identidad visual oficial de SIGCA.

Este documento establece las reglas visuales obligatorias para todas las pantallas del sistema.

Todo componente documentado en DESIGN-002 deberá respetar este documento.

---

# 2. Alcance

Aplica a:

- React
- TypeScript
- Materialize CSS
- Aplicación Web
- Aplicaciones futuras
- Material Icons

---

# 3. Principios de Diseño

La interfaz deberá transmitir:

- Simplicidad
- Claridad
- Confianza
- Cercanía
- Institucionalidad
- Modernidad
- Accesibilidad

Se evitarán interfaces sobrecargadas.

---

# 4. Identidad

El sistema utilizará dos logotipos oficiales.

## Logo Principal

Parroquia Santísima Trinidad

Archivo

frontend/public/logo-parroquia.png

---

## Logo Catequesis

Catequesis

Archivo

frontend/public/logo-catequesis.png

---

## Uso

Los dos logotipos deberán utilizarse siempre:

- misma altura
- mismo ancho visual
- misma importancia

Nunca deberá existir un logotipo dominante sobre el otro.

---

# 5. Paleta Oficial

## Primary

| Nivel | Color |
|--------|--------|
| 50 | #E3F2FD |
| 100 | #BBDEFB |
| 200 | #90CAF9 |
| 300 | #64B5F6 |
| 400 | #42A5F5 |
| 500 | #1565C0 |
| 600 | #1E88E5 |
| 700 | #1976D2 |
| 800 | #1565C0 |
| 900 | #0D47A1 |

---

## Secondary

| Nivel | Color |
|--------|--------|
| 500 | #42A5F5 |

---

## Success

#2E7D32

---

## Warning

#F9A825

---

## Danger

#D32F2F

---

## Background

#F5F7FA

---

## Surface

#FFFFFF

---

## Text Primary

#263238

---

## Text Secondary

#607D8B

---

## Divider

#CFD8DC

---

# 6. Tipografía

Fuente principal

Roboto

---

Peso

300

400

500

700

---

Títulos

500

---

Texto

400

---

Botones

500

---

# 7. Iconografía

Material Icons

Elemento	Tamaño	Peso
SIGCA	40 px	700
Sistema Integral de Gestión Catequética	22 px	500
Acceso al Sistema	16 px	400
Labels de Inputs	14 px	500
Texto de ayuda	13 px	400
Botón	16 px	500
Versión	12 px	400

---

# 8. Espaciado

xs

4 px

sm

8 px

md

16 px

lg

24 px

xl

32 px

2xl

48 px

3xl

64 px

---

# 9. Bordes

small

4 px

medium

8 px

large

12 px

card

16 px

pill

999 px

---

# 10. Sombras

Elevation 1

Cards

Elevation 2

Dialogs

Elevation 3

Menus

Elevation 4

Modals

---

# 11. Botones

Primary

Fondo azul Primary 500

Texto blanco

---

Secondary

Fondo gris claro

---

Outlined

Borde azul

---

Danger

Rojo

---

Success

Verde

---

Loading

Spinner

---

Disabled

Opacidad 50%

---

# 12. Inputs

Altura

48 px

Border Radius

8 px

Focus

Primary 500

Error

Danger

Helper Text

Text Secondary

---

# 13. Cards

Color

Surface

Radius

16 px

Padding

32 px

Shadow

Elevation 2

---

# 14. Responsive

Desktop

≥1200 px

Tablet

768–1199 px

Mobile

≤767 px

---

# 15. Pantalla de Login

La pantalla de Login representa la identidad institucional del sistema.

Deberá mantener el siguiente orden visual.

────────────────────────────────────────

LOGO PARROQUIA     LOGO CATEQUESIS

SIGCA

Sistema Integral de Gestión Catequética

────────────────────────────────────────

Usuario

Contraseña

[ Iniciar Sesión ]

────────────────────────────────────────

Versión 0.1.0

────────────────────────────────────────

## Reglas

Los dos logotipos deberán:

- aparecer en el mismo renglón;
- tener exactamente el mismo tamaño;
- estar perfectamente alineados;
- mantener separación uniforme.

No deberá mostrarse el nombre de la parroquia en el encabezado.

El protagonista visual será el nombre del sistema.

El formulario deberá encontrarse perfectamente centrado.

La tarjeta utilizará:

- fondo blanco;
- esquinas redondeadas;
- sombra suave;
- máximo ancho de 420 px.

---

# 16. Tokens

Todos los componentes deberán utilizar únicamente los valores definidos en este documento.

Queda prohibido utilizar colores, tamaños o tipografías codificados directamente dentro de los componentes.

---

# 17. Relación con DESIGN-002

DESIGN-002 define:

qué componentes existen.

DESIGN-003 define:

cómo deben verse esos componentes.

---

# Fin del Documento