#!/bin/bash

service mariadb start;

cat /var/lib/mysql/.setup 2> /dev/null
if [ $? -ne 0 ]; then

	mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
	mariadb -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS'";
	mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$USER'@'%'";
	mariadb -e "FLUSH PRIVILEGES";
	mariadb -e "ALTER USER '$ROOT_USER'@'localhost' IDENTIFIED BY '$ROOT_PASS'";

	mariadb $MYSQL_DATABASE -u$ROOT_USER -p$ROOT_PASS
	mysqladmin -u$ROOT_USER -p$ROOT_PASS shutdown

	touch /var/lib/mysql/.setup
fi

exec mysqld --console

# service mariadb start;

# while ! mysqladmin ping --silent; do
# 	sleep 1
# done

# echo "Create database"
# mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
# echo "Create user"
# mariadb -e "CREATE USER IF NOT EXISTS '$USER'@'localhost' IDENTIFIED BY '$PASS';"
# echo "Grant privileges"
# mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$USER'@'%' IDENTIFIED BY '$PASS';"
# sleep 1
# echo "Alter flush"
# mariadb -u root -p"$ROOT_PASS" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS'; FLUSH PRIVILEGES;"
# echo "Shutdown"
# mysqladmin -u root -p"$ROOT_PASS" shutdown
# sleep 1
# echo "Start in safe mode"
# exec mysqld_safe

# useful commands login mariadb and show that the DB is not empty:
# docker exec -it mariadb bash // logs into the container running bash, assuming mariadb is the container name
# mariadb -uroot -p // logs into mariadb, prompts for the password (stored in the apposite section of the .env file), logging in without pw
# should be reason to fail...
# SHOW TABLES FROM mariadb; // will list the tables present in teh database assuming mariadb is the database name