#if [ -d "directory_name" ]; then
#  echo "Directory exists"
#else
#  echo "Directory does not exist"
#fi
#seed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf
wp core download --allow-root --path=var/www/html/wp_server
wp config create --allow-root --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --path=var/www/html/wp_server
wp core install --allow-root --url=42-prueba.es --title="WP-CLI" --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=42_Inception@gmail.com --skip-email --path=var/www/html/wp_server
exec php-fpm7.3 -F