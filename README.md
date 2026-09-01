# La Rosa de Bella — invitación XV años

Invitación digital de una sola página. Fondo fotográfico con el fanal de
cristal, y sobre él una escena 3D dibujada en canvas: la rosa dentro del
cristal y seis pétalos en órbita que abren cada sección. Incluye cuenta
regresiva, vals sintetizado con Web Audio y confirmación por WhatsApp.

La rosa se ancla a las coordenadas del fanal *dentro de la imagen* (la
constante `FONDO` del script), no al viewport, así queda centrada en el
cristal en cualquier pantalla. Si cambias la imagen de fondo hay que
volver a medir `cx`, `yTapa` y `yBase`.

## Música

El vals es **propio**: se sintetiza en el navegador con Web Audio (16
compases en re mayor, caja de música + colchón de cuerdas + reverberación
generada). No hay archivo de audio, así que no hay descarga que esperar
ni licencia de por medio.

Ningún navegador permite sonido antes de que el visitante toque la
pantalla; no hay forma de saltarse eso. Por eso la invitación abre con
una **portada**: un botón «Abrir invitación» que, con el mismo toque,
descubre la escena y enciende la música. Desde el lado del invitado la
música empieza sola.

## Transición de entrada

Al pulsar «Abrir invitación» corre `transicion.mp4`: la misma escena del
fondo, animada. Termina en la misma composición que la imagen estática,
así que el encadenado hacia la invitación no se nota.

Va sin pista de audio, para que no pelee con el vals. Se precarga
mientras el invitado mira la portada, y si algo falla —no hay archivo,
el códec no va, la red se cae— se entra directo a la invitación. Un
toque en la pantalla la salta.

Es el único archivo que se sirve aparte junto con `portada.jpg`: 500 KB
incrustados harían muy lenta la primera carga.

## Notas de la música

La música se silencia si la pestaña pasa a segundo plano y vuelve al
regresar. Si el navegador acaba negando el permiso, el botón no se queda
marcado como sonando.

## Compartir el enlace

`portada.jpg` (1200x630) es la imagen que sale en WhatsApp, Facebook y
Telegram. Las etiquetas Open Graph viven en `construir.sh`, no en el HTML
fuente, porque necesitan la URL absoluta del sitio publicado.

Si cambias de dominio hay que actualizar `SITIO` en `construir.sh`.

## Armar el sitio

`index.html` se genera; no se edita a mano:

    bash construir.sh

Toma `rosa-encantada.html`, le añade el `<!doctype>`, el `<head>` y las
etiquetas para compartir, y escribe `index.html`.

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
- `portada.jpg` — la tarjeta que se ve al compartir el enlace.
- `transicion.mp4` — el vídeo de entrada (500 KB, sin audio).
- `construir.sh` — arma `index.html` desde `rosa-encantada.html`.
- `.nojekyll` — evita que GitHub Pages pase el sitio por Jekyll.

Único recurso externo: las tipografías de Google Fonts.
