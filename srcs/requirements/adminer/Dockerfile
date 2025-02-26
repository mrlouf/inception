FROM php:7.4-apache

# Install Adminer
RUN mkdir -p /var/www/html/adminer \
    && curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

# Expose port 8080
EXPOSE 8080

# Start Apache server
CMD ["apache2-foreground"]