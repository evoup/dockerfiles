CREATE DATABASE IF NOT EXISTS autoams;
CREATE USER 'dba'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON monitor.* TO 'dba'@'%';
