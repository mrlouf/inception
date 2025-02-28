FROM	debian:bullseye

RUN apt update
RUN apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

# create certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42/OU=42/CN=nponchon.42.fr/UID=nponchon"
# folder to keep NGINX config files
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# Permissions for users
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
