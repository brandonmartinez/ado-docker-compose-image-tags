# Based on https://github.com/nginxinc/NGINX-Demos/tree/master/nginx-hello
FROM nginx:alpine

# Update Alpine and Install Packages
RUN set -x && \
    apk add --update "libintl" && \
    apk add --virtual build_deps "gettext" &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

# Add Startup Resources
ADD environmentreplace.sh /docker-entrypoint.d/00-environmentreplace.sh
RUN chmod 775 /docker-entrypoint.d/00-environmentreplace.sh

# Remove stock NGINX config, add our own, add website resources
RUN rm /etc/nginx/conf.d/*
ADD hello.conf /etc/nginx/conf.d/
ADD index.template.html /usr/share/nginx/html/
