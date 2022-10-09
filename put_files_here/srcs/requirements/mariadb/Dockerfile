FROM alpine:3.15

# Necessary packages installation
RUN apk update && apk upgrade && \
	apk add mysql mysql-client mariadb mariadb-client

# MySQL configuration
RUN mkdir /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql
RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i "s|.*skip-networking*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

COPY tools/init.sh /tmp/init.sh
COPY tools/mysql.sql /mysql.sql

# Run script
ENTRYPOINT ["sh", "/tmp/init.sh"]
