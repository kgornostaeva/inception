#!/bin/sh

wp core install --url=http://192.168.99.101:5050 --title='DO NOT PANIC!' --admin_user=pvivian --admin_password=pvivian \
--admin_email=pvivian@student.21-school.ru --skip-email --path=/var/www/html/wordpress

wp user create trillian trillian@example.com --user_pass=arthur --role=author --path=/var/www/html/wordpress --url=http://192.168.99.101:5050
wp user create marvin marvin@example.com --user_pass=depression --role=subscriber --path=/var/www/html/wordpress

wp theme activate twentytwenty

/usr/bin/supervisord -c /etc/supervisord.conf
