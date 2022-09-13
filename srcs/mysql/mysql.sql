USE mysql;
GRANT ALL ON *.* TO 'root'@'%' identified by 'pvivian' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'wp'@'%' IDENTIFIED BY 'pvivian';
GRANT ALL PRIVILEGES ON wordpress.* to 'wp'@'%';
CREATE USER 'pma'@'%' IDENTIFIED BY 'pvivian';
CREATE DATABASE IF NOT EXISTS phpmyadmin;
GRANT ALL PRIVILEGES ON *.* to 'pma'@'%';
FLUSH PRIVILEGES;