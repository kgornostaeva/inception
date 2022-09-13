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
RUN apk update && apk upgrade && \
	apk add nginx openssl openssh openssh-server openrc supervisor

# SSL certificate creation
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
-subj /C=/ST=/L=/O=/OU=/CN=server/emailAddress=

# NGINX configuration
COPY nginx_config /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx

#SSH configuration 
RUN adduser -D nginx_user && echo "nginx_user:pvivian" | chpasswd
RUN ssh-keygen -n nginx_user -f /etc/ssh/nginx_key

# List ports & run script
EXPOSE 80 443 22
CMD /usr/bin/supervisord -c /etc/supervisord.conf