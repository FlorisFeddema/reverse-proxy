FROM nginx:latest
RUN apt update \
    && apt install openssl
ADD ./nginx.conf /etc/nginx/nginx.conf
