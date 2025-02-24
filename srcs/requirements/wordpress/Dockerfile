FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz

RUN chmod 755 /var/www/wordpress

RUN wget https://github.com/wp-cli/wp-cli/raw/refs/heads/main/utils/wp-completion.bash
RUN chmod +x wp-completion.bash
RUN mv wp-completion.bash /usr/local/bin/wp
