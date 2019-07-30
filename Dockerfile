FROM nginx:latest
RUN apk update \
    && apk add openssl
ADD ./nginx.conf /etc/nginx/nginx.conf
