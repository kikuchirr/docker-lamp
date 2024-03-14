FROM php:8.1-apache-bullseye

ENV APACHE_DOCUMENT_ROOT=/var/www/ecorange/html

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite
RUN apt update && apt install -y libonig-dev
RUN docker-php-ext-install pdo_mysql mysqli
RUN apt-get install vim -y
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug
#  && docker-php-ext-install pdo_mysql \
#  && docker-php-ext-install zip
#   && vim \
#   && zip \
#   && unzip \
#   && iputils-ping \
RUN echo '\
    log_errors = On\n\
    error_log = /dev/stderr\n\
    error_reporting = E_ALL\n\
    ' >> /usr/local/etc/php/php.ini

#RUN docker-php-ext-install pdo_mysql mysqli mbstring

#FROM php:8.1-apache-bullseye

#ENV APACHE_DOCUMENT_ROOT=/var/www/ecorange/html
#RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
#RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
#RUN a2enmod rewrite
#RUN apt-get update  \
#  && docker-php-ext-install pdo_mysql mysqli mbstring
  
WORKDIR /var/www/ecorange
