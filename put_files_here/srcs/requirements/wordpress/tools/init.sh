#!/bin/sh

wp core download

cp /tmp/wp-config.php /var/www/html/wp-config.php

wp core install --url=https://localhost --title='DO NOT PANIC!' --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD \
--admin_email=pvivian@student.21-school.ru --skip-email --path=/var/www/html

wp user create trillian trillian@example.com --user_pass=arthur --role=author --path=/var/www/html --url=https://localhost

wp theme activate twentytwenty

/usr/sbin/php-fpm7 -R -F