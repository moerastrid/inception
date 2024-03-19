#!/bin/sh

sleep 3
chown -R www-data:www-data /var/www/

if [ ! -f "/var/www/wordpress/index.php" ]; then
	sudo -u www-data sh -c " \
	wp core download --locale=$LANGUAGE
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$USER --dbpass=$PASS --dbhost=db_service --dbcharset="utf8"
	wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ROOT_USER --admin_password=$ROOT_PASS --admin_email=$ROOT_EMAIL
	wp user create $USER $EMAIL --role=author --user_pass=$PASS
	"
fi
exec /usr/sbin/php-fpm7.4 -F