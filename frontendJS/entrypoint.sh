#!/bin/sh
# Dodati su \" pre i posle varijable da bi se URL upisao kao string
sed -i "s#%%VITE_API_URL%%#\"$VITE_API_URL\"#g" /usr/share/nginx/html/config.js
exec nginx -g 'daemon off;'