#!/bin/bash

# Wait for the database service to be ready
until mysqladmin ping -h"$SQL_HOSTNAME" --silent; do
    sleep 2
done

# Check if WordPress is already installed
if [ -f /var/www/wordpress/wp-config.php ]; then
    echo "WordPress already exists. Skipping installation."
else
    
	# Download WordPress core files
    wp core download --allow-root

    # Generate wp-config.php with the given database details
    wp config create \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=$SQL_HOSTNAME \
        --allow-root

    # Add Redis configuration to wp-config.php
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config set WP_CACHE true --allow-root

    # Install WordPress with the given site details
    wp core install \
        --url=$DOMAIN_NAME \
        --title="$WORDPRESS_TITLE" \
        --admin_user=$WORDPRESS_ADMIN \
        --admin_password=$WORDPRESS_ADMIN_PASS \
        --admin_email=$WORDPRESS_ADMIN_EMAIL \
        --skip-email \
        --allow-root \

    # Create an additional user with contributor role
    wp user create $WORDPRESS_USER $WORDPRESS_EMAIL \
        --role=contributor \
        --user_pass=$WORDPRESS_USER_PASS \
        --allow-root \

    # Install and activate the Redis Object Cache plugin
    wp plugin install redis-cache --activate --allow-root
    
    # Enable the Redis object cache
    wp redis enable --allow-root

    # Install and activate the default WordPress theme
    wp theme install twentytwentyfour --activate --allow-root

    adduser $FTP_USER www-data
    chown -R www-data:www-data /var/www
    chmod -R g+rw /var/www
    
fi

# Start PHP-FPM in the foreground for proper container behavior
exec /usr/sbin/php-fpm7.4 -F