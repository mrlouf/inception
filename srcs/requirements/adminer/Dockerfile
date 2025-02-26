FROM php:7.4-apache

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo 
	
# Install Adminer
RUN mkdir -p /var/www/html/adminer \
    && curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

RUN echo "<Directory /var/www/html>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride None\n\tRequire all granted\n</Directory>" >> /etc/apache2/sites-available/000-default.conf

# Expose port 8081
EXPOSE 8081

# Start Apache server
CMD ["apache2-foreground"]