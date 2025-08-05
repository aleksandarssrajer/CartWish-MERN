#!/bin/sh
# Ova skripta menja placeholder sa pravim URL-om.

sed -i "s#%%API_URL_PLACEHOLDER%%#${VITE_API_URL}#g" /usr/share/nginx/html/config.js

# Pokreni Nginx
exec nginx -g 'daemon off;'
