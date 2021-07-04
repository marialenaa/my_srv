#!/bin/bash

mysql -u root -p
MariaDB [(none)]> CREATE DATABASE wpdb;
MariaDB [(none)]> CREATE USER 'wpuser'@'localhost' identified by 'dbpassword';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;i
MariaDB [(none)]> EXIT;
cd /var/www/html/
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php

chown -R www-data:www-data /var/www/html/wordpress

