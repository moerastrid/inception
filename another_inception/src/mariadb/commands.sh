#!/bin/sh

# mariadb-upgrade
# mariadb-install-db --defaults-extra-file=/etc/my.cnf --skip-test-db

# CONF_FILE=/etc/my.cnf
# mysql_install_db --defaults-extra-file=$CONF_FILE --skip-test-db

# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysqld

mariadb-install-db --defaults-extra-file=/etc/my.cnf --skip-test-db

cat << EOF > init.sql

	FLUSH PRIVILEGES;

	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

EOF

mysqld --user=mysql < init.sql