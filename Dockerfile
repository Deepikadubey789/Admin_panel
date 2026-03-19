FROM php:8.2-apache
RUN apt-get update && apt-get install -y libzip-dev zip libpng-dev \
    && docker-php-ext-install zip pdo pdo_mysql bcmath mysqli gd
RUN a2enmod rewrite
WORKDIR /var/www/html
COPY . .
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
EXPOSE 80

