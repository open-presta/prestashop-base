FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y \
    libicu-dev \
    g++

RUN docker-php-ext-install -j$(nproc) \
    zip \
    pdo_mysql \
    intl \
    opcache

RUN a2enmod rewrite