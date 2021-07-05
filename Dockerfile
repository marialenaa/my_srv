FROM debian:buster

# update environment 
RUN apt-get update

# install & active nginx
RUN apt-get install -y nginx vim 

#install & acrtive mysql
RUN apt-get install -y mariadb-server mariadb-client 

# install & active php
RUN apt-get install -y php7.3 \
		php7.3-fpm \
                php7.3-mysql \
		php-common \
		php7.3-cli \
		php7.3-common \
		php7.3-json \
		php7.3-opcache \
		php7.3-readline \
		php-curl \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip \
		wget


WORKDIR /var/www/html

# copy & link my own default file nginx
COPY srcs/ssl/default.conf /etc/nginx/sites-available/   
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/
RUN rm -rf /etc/nginx/sites-enabled/default

# install phpmyadmin + wordpress & clean up
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz \
    https://wordpress.org/latest.tar.gz
RUN tar -xvf phpMyAdmin-5.1.0-english.tar.gz \
    && tar -xvzf latest.tar.gz 
    ##order & clean
RUN mv phpMyAdmin-5.1.0-english/ /var/www/html/phpmyadmin \
    && rm -rf /var/www/html/index.nginx-debian.html \
    phpMyAdmin-5.1.0-english.tar.gz
RUN rm -rf latest.tar.gz \
    /var/www/html/phpmyadmin/config.sample.inc.php

# copy my own files config wordpress & phpmyadmin
COPY srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php

# create ssl & copy my conf nginx
RUN mkdir /etc/nginx/ssl/
COPY srcs/ssl/default.conf /etc/nginx/sites-available/default

# install + generation key with path
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=PARIS/L= /O=42/OU= /CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
RUN openssl dhparam -out /etc/nginx/ssl/dhparam.pem 1024

# permission access
RUN chmod -R 755 /var/www/*
RUN chown -R www-data:www-data wordpress/*

# copy autoindex & set env autoindex
COPY srcs/toggle_autoindex.sh .
ENV autoindex=on

#copy launch services
COPY ./srcs/services.sh .
CMD bash ./services.sh

# juste to inform
EXPOSE 80 443

