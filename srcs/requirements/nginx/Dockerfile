FROM	debian:bullseye

# make sure packets are up-to-date
RUN apt update
# install nginx
RUN apt install nginx -y
# create folder for ssl files and install openssl
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
# create certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42/OU=42/CN=nponchon.42.fr/UID=nponchon"
# folder to keep NGINX config files
RUN mkdir -p /var/run/nginx

# Copy inception config file into NGINX container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Permissions for users
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
