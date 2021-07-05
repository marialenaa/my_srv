#!/bin/bash

service nginx start                       
service mysql start                       
service php7.3-fpm start        
                                       
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password                       
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password                       
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password                  

sed -i “s/autoindex on;/autoindex off;/g” /etc/nginx/sites-available/nginx.config 

service nginx restart

sleep infinity & wait     
#bash
#nginx -g 'daemon off;'
