# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pvivian <pvivian@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:38:17 by pvivian           #+#    #+#              #
#    Updated: 2020/11/30 14:38:17 by pvivian          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.15

# Necessary packages installation
RUN apk update && apk upgrade && apk add nginx openssl

# SSL certificate creation
RUN mkdir /etc/ssl/private && \
     openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
    -subj /C=/ST=/L=/O=/OU=/CN=server/emailAddress=

# NGINX configuration
RUN mkdir -p /run/nginx
COPY nginx_config /etc/nginx/conf.d/default.conf

# List ports & run
EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]