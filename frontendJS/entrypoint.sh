#!/bin/sh
# frontendJS/entrypoint.sh

# Nađi placeholder u config.js i zameni ga sa vrednošću iz env varijable
# Koristimo duple navodnike oko "$VITE_API_URL" da bi se varijabla expandovala
# Koristimo drugi delimiter za sed (recimo #) jer URL može sadržati /
sed -i "s#%%VITE_API_URL%%#\"$VITE_API_URL\"#g" /usr/share/nginx/html/config.js

# Pokreni originalnu komandu (Nginx)
exec nginx -g 'daemon off;'