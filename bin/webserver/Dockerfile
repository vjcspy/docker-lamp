FROM php:7.1-apache

RUN apt-get update

RUN apt-get install -y g++

# install extensions

RUN apt-get install -y libcurl4-openssl-dev
RUN docker-php-ext-install curl

RUN apt-get install -y libicu-dev
RUN docker-php-ext-install intl

RUN docker-php-ext-install mbstring

RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install dom xml

RUN docker-php-ext-install pdo_mysql mysqli

RUN apt-get install -y libgd-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr
RUN docker-php-ext-install gd exif

# xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Enable apache modules
RUN a2enmod rewrite