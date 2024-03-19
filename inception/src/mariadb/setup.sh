# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:54:40 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 16:16:26 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

service mysql start;

cat /var/lib/mysql/.setup 2> /dev/null
if [ $? -ne 0 ]; then

	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
	mysql -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS'";
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$USER'@'%'";
	mysql -e "FLUSH PRIVILEGES";
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';";
	mysql -e "FLUSH PRIVILEGES";

	mysql $MYSQL_DATABASE -u$ROOT_USER -p$ROOT_PASS
	mysqladmin -u$ROOT_USER -p$ROOT_PASS shutdown

	touch /var/lib/mysql/.setup
fi

exec mysqld --console