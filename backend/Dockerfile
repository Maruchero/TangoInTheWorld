FROM php:8.3-apache

RUN apt-get update
RUN apt-get install -y git zip unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer require league/oauth2-server

RUN docker-php-ext-install mysqli

COPY api/ /var/www/html/api/
COPY db/ /var/www/html/db/

# Env variables for standalone usage
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=rootp4ssw0rd
ENV MYSQL_HOST=localhost
ENV MYSQL_PORT=3306
ENV MYSQL_DATABASE=test

# Allow the script to be executed
RUN chmod +x /var/www/html/db/initialize.sh

# Set the script to run before starting the server
CMD ["/var/www/html/db/initialize.sh"]
