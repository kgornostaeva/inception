FROM alpine:3.15

# Necessary packages installation
RUN apk update && apk upgrade && \
	apk add php php-fpm php-mysqli php-json php-common php-cli php-mbstring \
	php-zip php-phar php-bz2 wget curl

# Wordpress installation
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz  && \
	tar -xf latest.tar.gz && rm -rf latest.tar.gz

# WP CLI installation & configuration
RUN  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# WORDPRESS configuration
COPY tools/init.sh /tmp/init.sh
COPY conf/wp-config.php /tmp/wp-config.php
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

RUN	adduser -S nginx &&	addgroup -S nginx && chown -R nginx /var/www/html
RUN adduser -D -g 'www' www && chown -R www /var/www/html && chmod 755 -R /var/www/html

# Run script
WORKDIR /var/www/html
ENTRYPOINT ["sh", "/tmp/init.sh"]
