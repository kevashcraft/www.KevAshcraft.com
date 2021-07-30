FROM nginx:1.17.10 as webserver

COPY build/nginx.conf /etc/nginx/nginx.conf
COPY app/src /usr/share/nginx/html
