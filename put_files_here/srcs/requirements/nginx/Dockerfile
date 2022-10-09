FROM alpine:3.15

# Necessary packages installation
RUN apk update && apk upgrade && apk add nginx openssl

# SSL certificate creation
RUN mkdir /etc/ssl/private && \
     openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
    -subj /C=/ST=/L=/O=/OU=/CN=server/emailAddress=

# NGINX configuration
RUN mkdir -p /run/nginx
COPY conf/nginx_config /etc/nginx/http.d/default.conf

# Run script
ENTRYPOINT ["nginx", "-g", "daemon off;"]