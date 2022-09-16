#!/bin/sh

wp core download

cp /tmp/wp-config.php /var/www/html/wordpress/wp-config.php

wp core install --url=https://localhost --title='DO NOT PANIC!' --admin_user=pvivian --admin_password=pvivian \
--admin_email=pvivian@student.21-school.ru --skip-email --path=/var/www/html/wordpress

wp user create trillian trillian@example.com --user_pass=arthur --role=author --path=/var/www/html/wordpress --url=https://localhost
wp user create marvin marvin@example.com --user_pass=depression --role=subscriber --path=/var/www/html/wordpress

wp theme activate twentytwenty

/usr/sbin/php-fpm7 -R -F