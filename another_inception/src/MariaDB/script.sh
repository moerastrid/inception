#!/bin/sh

service mysql start;

if [ $? -ne 0 ]; then

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@localhost IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mysql -e "ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

	mysql $MYSQL_DATABASE -uroot -p$MYSQL_ROOT_PASSWORD	
	mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

fi

exec mysqld --console