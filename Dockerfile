FROM php:7.2-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/ecorange/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite
RUN apt-get update  \
  && docker-php-ext-install pdo_mysql mysqli mbstring
RUN pecl install xdebug-3.1.6 && docker-php-ext-enable xdebug
#RUN apt install vim
WORKDIR /var/www/ecorange
