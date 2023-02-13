#!/bin/sh

# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/

mkdir -p /var/www/html/wordpress /run/php
chown -R www-data:www-data /var/www/

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf;

wp core download --allow-root --path=/var/www/html/wordpress
wp core config --allow-root --path=/var/www/html/wordpress \
    --dbhost=${MYSQL_HOST} \
    --dbname=${MYSQL_DB} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_USER_PWD}
wp core install --allow-root --path=/var/www/html/wordpress \
    --url=${DOMAIN_NAME} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN} \
    --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL}
wp user create --allow-root ${WP_USER} ${WP_EMAIL} --path=/var/www/html/wordpress \
    --path=/var/www/html/wordpress \
    --role=author \
    --user_pass=${WP_USER_PASSWORD}
# https://developer.wordpress.org/cli/commands/theme/activate/
# wp --allow-root --path=/var/www/html/wordpress \
#     theme activate twentytwentytwo

exec /usr/sbin/php-fpm7.3 --nodaemonize
