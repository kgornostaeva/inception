# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pvivian <pvivian@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:38:03 by pvivian           #+#    #+#              #
#    Updated: 2020/11/30 14:38:03 by pvivian          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

COPY init.sh .
COPY mysql.sql /mysql.sql
VOLUME ["/var/lib/mysql"]

# List ports & run script
EXPOSE 3306
CMD ["sh", "init.sh"]
