# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pvivian <pvivian@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:38:33 by pvivian           #+#    #+#              #
#    Updated: 2020/11/30 14:38:33 by pvivian          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.15

# Necessary packages installation
RUN apk update && apk upgrade && \
	apk add nginx php php-fpm php-mysqli php-json php-common php-cli php-mbstring \
	php-zip php-phar php-bz2 supervisor wget curl

# Wordpress installation
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz  && \
	tar -xf latest.tar.gz && rm -rf latest.tar.gz

# WP CLI installation & configuration
RUN  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# NGINX && WORDPRESS configuration
COPY init.sh .
COPY configs/wp-config.php .
COPY configs/nginx_config /etc/nginx/conf.d/default.conf
RUN mv wp-config.php /var/www/html/wordpress

RUN adduser -D -g 'www' www && chown -R www /var/www/html/wordpress && chmod 755 -R /var/www/html/wordpress
COPY configs/supervisor.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx

# List ports & run script
WORKDIR /var/www/html/wordpress
EXPOSE 5050
CMD ["sh", "../init.sh"]
