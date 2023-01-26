echo 'CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;'  >> database.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" >> database.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}' WITH GRANT OPTION;" >> database.sql
echo "ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> database.sql
#seed -i "s/127.0.0.1/0.0.0.0" /etc/mysql/mariadb.conf.d/50-server.cnf