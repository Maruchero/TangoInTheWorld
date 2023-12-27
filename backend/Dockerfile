FROM php:8.3-apache

RUN docker-php-ext-install mysqli

COPY . /var/www/html

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
