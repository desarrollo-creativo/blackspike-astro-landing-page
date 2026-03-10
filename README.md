# Landing Page — Desarrollo Creativo

Landing page institucional de Desarrollo Creativo, construida con [Astro](https://astro.build/) y [Tailwind CSS v4](https://tailwindcss.com/).

## Stack

- **Framework**: Astro
- **Estilos**: Tailwind CSS v4 via `@tailwindcss/vite` — tokens de diseño definidos con `@theme` en `global.css`
- **Tipografía**: Inter (archivos WOFF2 locales)
- **Despliegue**: Docker + nginx (imagen estática)

## Comandos de desarrollo

| Comando                   | Acción                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Instala dependencias                             |
| `npm run dev`             | Inicia el servidor de desarrollo en `localhost:4321` |
| `npm run build`           | Genera el sitio de producción en `./dist/`       |
| `npm run preview`         | Previsualiza el build localmente                 |
| `npm run astro ...`       | Ejecuta comandos de la CLI de Astro              |

## Comandos Docker

| Comando                           | Acción                      |
| :-------------------------------- | :--------------------------- |
| `docker build -t lp-dc .`         | Construye la imagen          |
| `docker run -p 4321:80 -t lp-dc`  | Inicia el contenedor         |

## Variables de entorno

Copia `.env.example` a `.env` y completa los valores:

```bash
cp .env.example .env
```

### `PUBLIC_EVOLUTION_DOMAIN`

URL base de la instancia de [Evolution API](https://doc.evolution-api.com/) (WhatsApp).

```
PUBLIC_EVOLUTION_DOMAIN=https://api.tudominio.com
```

**Efecto**: Si está vacía, los formularios de contacto (modal y newsletter) no podrán enviar mensajes de WhatsApp. Los formularios seguirán renderizándose pero las solicitudes fallarán.

---

### `PUBLIC_EVOLUTION_INSTANCE`

Nombre de la instancia de Evolution API que recibirá los mensajes.

```
PUBLIC_EVOLUTION_INSTANCE=nombre-de-instancia
```

**Efecto**: Determina qué número/instancia de WhatsApp recibe los leads del formulario. Sin este valor, el endpoint de envío no sabrá a qué instancia dirigir el mensaje.

---

### `PUBLIC_EVOLUTION_TOKEN`

Token de autenticación de la instancia de Evolution API.

```
PUBLIC_EVOLUTION_TOKEN=tu-token-secreto
```

**Efecto**: Se incluye en el header de autorización de cada llamada a la API. Sin un token válido, la API rechazará las solicitudes con error 401.

---

> **Nota**: Las tres variables son consumidas en tiempo de build por `DialogModal.astro` y `NewsletterSection.astro`. Al ser variables `PUBLIC_*`, quedan embebidas en el HTML generado — no incluir información sensible más allá del token de API.

> **Google Analytics**: El ID de medición (`G-XXXXXXXXXX`) está hardcodeado en `src/layouts/Layout.astro`. Para cambiarlo, editar la constante `gaMeasurementId` en ese archivo.
