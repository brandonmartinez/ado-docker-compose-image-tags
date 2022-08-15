#!/bin/sh

echo "Replacing Environment Variables in Index Template to Index"
cat /usr/share/nginx/html/index.template.html | envsubst > /usr/share/nginx/html/index.html
