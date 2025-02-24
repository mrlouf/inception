RUN apt-get update
RUN apt-get upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadbclient

RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress


