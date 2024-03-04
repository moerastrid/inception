#!/bin/sh

# mariadb-upgrade
# mariadb-install-db --defaults-extra-file=/etc/my.cnf --skip-test-db

# CONF_FILE=/etc/my.cnf
# mysql_install_db --defaults-extra-file=$CONF_FILE --skip-test-db

# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysqld

# mariadb-install-db --defaults-extra-file=/etc/my.cnf --skip-test-db

# cat << EOF > init.sql

# 	FLUSH PRIVILEGES;

# 	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

# EOF

# mysqld --user=mysql < init.sql

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown
# exec mysql_safe

DB_DIR=/data/database
CONF_FILE=/etc/my.cnf

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql "$DB_DIR"
cd "$DB_DIR" || exit 1

if [ ! -d "$DB_DIR/mysql" ]; then
  echo "Database does not exist, creating..."
  mysql_install_db --defaults-extra-file=$CONF_FILE --skip-test-db

  echo "Setting up users (and stuff)"
  mysqld --defaults-extra-file=$CONF_FILE --bootstrap << EOF
	CREATE DATABASE IF NOT EXISTS \'${MYSQL_DATABASE}\';
	CREATE USER IF NOT EXISTS \'${MYSQL_USER}\'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON \'${MYSQL_DATABASE}\'.* TO \'${MYSQL_USER}\'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	FLUSH PRIVILEGES;
EOF

  echo "Theoretically done setting up the db!"
fi

echo "Running mariadb!"
exec mariadbd --defaults-extra-file=$CONF_FILE --console