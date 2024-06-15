FROM alpine:3.18.6

ARG TARGET=simple_site

RUN apk update && \
apk upgrade && \
apk add --no-cache \
nginx

COPY ./configs/${TARGET}.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /run/nginx

RUN mkdir -p /var/www

COPY ./www/${TARGET}/ /var/www/mysite

CMD ["nginx", "-g", "daemon off;"]