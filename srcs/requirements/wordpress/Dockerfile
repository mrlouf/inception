FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client curl

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /run/php && chmod 755 /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh

WORKDIR /var/www/html

ENTRYPOINT ["bash", "/usr/local/bin/auto_config.sh"]