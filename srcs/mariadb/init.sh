#!/bin/sh

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql;
mysqld -u mysql --init-file=/mysql.sql