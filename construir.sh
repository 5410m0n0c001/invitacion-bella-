#!/usr/bin/env bash
# Arma index.html (el sitio autónomo) a partir de rosa-encantada.html
# (la fuente del Artifact, que va sin <!doctype>/<head>/<body>).
#
#   bash construir.sh
#
set -euo pipefail
cd "$(dirname "$0")"

SITIO="https://5410m0n0c001.github.io/invitacion-bella-"
TITULO="Bella · Mis XV Años"
DESCRIPCION="Sábado 20 de marzo de 2027. Toca un pétalo para ver los detalles y confirmar tu asistencia."

{
  cat <<HEAD
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#0B1622">
<meta name="description" content="${DESCRIPCION}">
<link rel="canonical" href="${SITIO}/">

<!-- Tarjeta al compartir el enlace (WhatsApp, Facebook, Telegram…).
     og:image tiene que ser una URL absoluta y un archivo real:
     los rastreadores no leen data URIs. -->
<meta property="og:type" content="website">
<meta property="og:site_name" content="Primavera Events Group">
<meta property="og:locale" content="es_MX">
<meta property="og:url" content="${SITIO}/">
<meta property="og:title" content="${TITULO}">
<meta property="og:description" content="${DESCRIPCION}">
<meta property="og:image" content="${SITIO}/portada.jpg">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="Una rosa roja iluminada sobre un cielo nocturno">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="${TITULO}">
<meta name="twitter:description" content="${DESCRIPCION}">
<meta name="twitter:image" content="${SITIO}/portada.jpg">
HEAD
  # rosa-encantada.html empieza con <title>, las tipografías y el <style>:
  # eso pertenece al <head>. El cuerpo arranca en el canvas del polen.
  awk '/^<canvas id="polen"/ && !hecho { print "</head>\n<body>"; hecho=1 } { print }' \
      rosa-encantada.html
  printf '\n</body>\n</html>\n'
} > index.html

echo "index.html: $(du -h index.html | cut -f1)"
