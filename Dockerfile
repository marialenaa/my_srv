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

RUN chown -R www-data:www-data /var/www/*

# copy & link my own default file nginx
COPY srcs/ssl/default.conf /etc/nginx/sites-available/   
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/
RUN rm -rf /etc/nginx/sites-enabled/default

# install phpmyadmin & clean up
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xvf phpMyAdmin-5.1.0-english.tar.gz
RUN mv phpMyAdmin-5.1.0-english/ /var/www/html/phpmyadmin && \
    rm /var/www/html/index.nginx-debian.html
RUN rm -rf phpMyAdmin-5.1.0-english.tar.gz
RUN rm -rf /var/www/html/phpmyadmin/config.sample.inc.php

# copy my own files config wordpress & phpmyadmin
COPY srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php

# permission access
RUN chmod -R 755 /var/www/*
RUN chown -R www-data:www-data /var/www/html/wordpress/*

# install & setup ssl + generation key with path
RUN mkdir /etc/nginx/ssl/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=PARIS/L= /O=42/OU= /CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
#RUN openssl dhparam -out /etc/nginx/dhparam.pem 1024

# copy my conf nginx
COPY srcs/ssl/default.conf /etc/nginx/sites-available/default

#copy launch services
COPY ./srcs/services.sh .                       
CMD bash ./services.sh

# juste to inform
EXPOSE 80 443

