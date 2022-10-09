USE mysql;

ALTER USER 'root'@'localhost' identified by 'pvivian';
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'pvivian'@'%' IDENTIFIED BY 'pvivian';
GRANT ALL PRIVILEGES ON wordpress.* to 'pvivian'@'%';

FLUSH PRIVILEGES;