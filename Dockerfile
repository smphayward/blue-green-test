FROM php:7.4-apache 

# Install MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql 

# Enable modules
RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
RUN cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/

# PHP Development Configuration
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini