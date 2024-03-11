#!/bin/sh

sleep (10)

wp config create --allow-root\
	--dbname=$MYSQL_DATABASE\
	--dbuser=$MYSQL_USER\
	--dbpass=$MYSQL_USER_PASSWORD\
	--dbhost=db:3306 --path='~/data/webfiles/wordpress'

/usr/sbin/php-fpm7.3 -F