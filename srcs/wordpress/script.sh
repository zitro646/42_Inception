
wp core download --allow-root --path=var/www/html/wp_server
wp config create --allow-root --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --path=var/www/html/wp_server
wp core install --allow-root --url=42-prueba.es --title="WP-CLI" --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=42_Inception@gmail.com --skip-email --path=var/www/html/wp_server
#/etc/init.d/php7.3-fpm start
#exec php-fpm7.3 -D
while true; do
  sleep 100 
done