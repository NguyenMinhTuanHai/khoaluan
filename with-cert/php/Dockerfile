FROM php:7.3.27-fpm

RUN apt-get update -y && docker-php-ext-install mysqli pdo_mysql 

WORKDIR /data/cms_dev/