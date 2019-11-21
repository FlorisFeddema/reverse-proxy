FROM nginx:alpine

ADD ./nginx.conf /etc/nginx/nginx.conf

ADD ./proxy-headers.conf /etc/nginx/proxy-headers.conf
ADD ./security.conf /etc/nginx/security.conf
ADD ./compression.conf /etc/nginx/compression.conf