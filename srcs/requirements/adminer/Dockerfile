FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    apache2 \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-gd \
    libapache2-mod-php7.4 \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    curl

COPY tools/php_extensions.sh /usr/local/bin/php_extensions.sh

RUN chmod +x /usr/local/bin/php_extensions.sh

# Run the script to install PHP extensions
RUN /usr/local/bin/php_extensions.sh

RUN mkdir -p /var/www/html/adminer \
    && curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

# Update Apache configuration to serve Adminer from /adminer
RUN echo "<Directory /var/www/html/adminer>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride None\n\tRequire all granted\n</Directory>" >> /etc/apache2/sites-available/000-default.conf
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

EXPOSE 8081

# Start PHP-FPM & Apache server
CMD service php7.4-fpm start && apache2ctl -D FOREGROUND