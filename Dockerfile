FROM --platform=linux/amd64 alpine:latest

RUN apk update
RUN apk add nginx
RUN adduser -D -g '1001' 1001
RUN mkdir /app && \
        chown -R 1001:1001 /var/lib/nginx && \
        chown -R 1001:1001 /var/log/nginx && \
        chmod -R 755 /var/log/nginx && \
        chown 1001:1001 /var/run/nginx && \
        chown -R 1001:1001 /app

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /app/index.html

EXPOSE 8080

## run server
CMD [ "nginx" ,"-g", "daemon off;"]