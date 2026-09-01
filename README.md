# La Rosa de Bella — invitación XV años

Invitación digital de una sola página. Fondo fotográfico con el fanal de
cristal, y sobre él una escena 3D dibujada en canvas: la rosa dentro del
cristal y seis pétalos en órbita que abren cada sección. Incluye cuenta
regresiva, vals sintetizado con Web Audio y confirmación por WhatsApp.

La rosa se ancla a las coordenadas del fanal *dentro de la imagen* (la
constante `FONDO` del script), no al viewport, así queda centrada en el
cristal en cualquier pantalla. Si cambias la imagen de fondo hay que
volver a medir `cx`, `yTapa` y `yBase`.

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

- `index.html` — el sitio. Autónomo: la imagen de fondo va incrustada
  como data URI WebP (~150 KB), así que no hay assets sueltos que se
  puedan romper al mover el sitio de sitio.
- `rosa-encantada.html` — el mismo contenido sin el envoltorio
  `<!doctype>/<head>/<body>`, para publicar como Artifact de Claude.
- `.nojekyll` — evita que GitHub Pages pase el sitio por Jekyll.

Único recurso externo: las tipografías de Google Fonts.
