# La Rosa de Bella — invitación XV años

Invitación digital de una sola página. Escena 3D (rosa bajo fanal + seis
pétalos en órbita que abren cada sección), cuenta regresiva, vals
sintetizado con Web Audio y confirmación por WhatsApp.

## Desplegar en GitHub Pages

Sitio estático sin compilación. Settings → Pages → Deploy from a branch →
rama `main`, carpeta `/ (root)`.

## Editar los datos

Todo lo editable vive en el objeto `EVENTO`, al inicio del `<script>` de
`index.html`. Nada más hay que tocar.

Los valores marcados `EJEMPLO` son de relleno. Los marcados `PENDIENTE`
hay que cambiarlos antes de publicar: mientras `whatsapp` contenga
`0000`, el formulario no envía nada a nadie — copia el mensaje al
portapapeles y avisa que falta configurarlo.

## Archivos

- `index.html` — el sitio. Autónomo: sin dependencias ni assets locales.
- `rosa-encantada.html` — el mismo contenido sin el envoltorio
  `<!doctype>/<head>/<body>`, para publicar como Artifact de Claude.
- `.nojekyll` — evita que GitHub Pages pase el sitio por Jekyll.

Único recurso externo: las tipografías de Google Fonts.
