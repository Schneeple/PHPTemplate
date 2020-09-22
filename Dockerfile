#https://semaphoreci.com/community/tutorials/dockerizing-a-php-application
FROM php:7-apache
LABEL MAINTAINER=Schneeple

COPY . /etc/files
COPY docker-config/000-defualt.conf /etc/apache2/sites-available/000-default.conf
COPY docker-config/start-apache /usr/local/bin
RUN a2enmod rewrite
RUN chmod 755 /usr/local/bin/start-apache

# Copy application source
COPY root/ /var/www
COPY sql/ /var/sql
COPY php/ /var/php
RUN chown -R www-data:www-data /var/www

# Useful commands
# RUN apt-get update &&  apt-get install nodejs
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ROOT_USER=root

CMD ["start-apache"]