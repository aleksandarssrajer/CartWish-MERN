#!/bin/sh

echo "--- Entrypoint skripta je pokrenuta ---"
echo "Primljena VITE_API_URL vrednost: '$VITE_API_URL'"

# Proveravamo da li fajl postoji pre izmene
if [ -f /usr/share/nginx/html/config.js ]; then
    echo "Fajl config.js pronađen. Vrši se zamena placeholdera."
    # Koristimo # kao delimiter da izbegnemo probleme sa kosim crtama u URL-u
    # Dodajemo navodnike oko varijable
    sed -i "s#%%VITE_API_URL%%#\"$VITE_API_URL\"#g" /usr/share/nginx/html/config.js
else
    echo "GREŠKA: Fajl config.js NIJE pronađen na putanji /usr/share/nginx/html/config.js"
fi

echo "--- Sadržaj fajla config.js NAKON izmene ---"
cat /usr/share/nginx/html/config.js
echo "---------------------------------------------"

echo "Pokrećem Nginx..."
exec nginx -g 'daemon off;'