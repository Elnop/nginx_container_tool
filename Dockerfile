FROM alpine:3.18.6

ARG CONFIG=configs/simple_site.conf
ARG WWW=www/simple_site

RUN apk update && \
apk upgrade && \
apk add --no-cache \
nginx

COPY ${CONFIG} /etc/nginx/http.d/default.conf

RUN mkdir -p /run/nginx

RUN mkdir -p /var/www

COPY ${WWW} /var/www/mysite

CMD ["nginx", "-g", "daemon off;"]