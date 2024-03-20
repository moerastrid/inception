#!/bin/bash

service mariadb start;

cat /var/lib/mysql/.setup 2> /dev/null
if [ $? -ne 0 ]; then

	mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mariadb -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS';"
	mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$USER'@'%';"
	mariadb -e "FLUSH PRIVILEGES;"

	mariadb $MYSQL_DATABASE -u$ROOT_USER -p[$ROOT_PASS]
	mariadb -e "FLUSH PRIVILEGES;"
	mysqladmin -u$ROOT_USER -p$ROOT_PASS shutdown

	touch /var/lib/mysql/.setup
fi

exec mysqld --console


# mariadb -e "ALTER USER root@localhost IDENTIFIED BY '$ROOT_PASS'";