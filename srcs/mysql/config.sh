echo 'CREATE DATABASE IF NOT EXISTS '"$MYSQL_DATABASE_NAME" ';'  >> input_data/test.sql
echo 'CREATE USER IF NOT EXISTS '"'$MYSQL_ADMIN_USER'"'@'"'%'"' IDENTIFIED BY '"'$MYSQL_USER_PASSWORD'" ';' >> input_data/test.sql
echo 'GRANT ALL PRIVILEGES ON *.* TO '"$MYSQL_ADMIN_USER"' IDENTIFIED BY '"'$MYSQL_USER_PASSWORD'" ';' >> input_data/test.sql
echo 'ALTER USER root@localhost IDENTIFIED BY '"'$MYSQL_ROOT_PASSWORD'" ';' >> input_data/test.sql
#echo 'DROP USER IF EXISTS root;' >> input_data/test.sql
echo 'FLUSH PRIVILEGES;' >> input_data/orders.sql
#echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME ;" >> /prueba.sql