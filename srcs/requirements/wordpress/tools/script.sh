#Añadimos este directorio
mkdir -p /run/php/
#Modificamos el archivo www.conf para que escuche cualquier IP en ese puerto
sed -i "s#listen = /run/php/php7.3-fpm.sock#listen = 0.0.0.0:9000#" /etc/php/7.3/fpm/pool.d/www.conf

#Con esto descargamos y configuramos el server WP CLI si se ejecuta por primera vez
if [ ! -d "/var/www/html/wp_server" ]; then
    wp core download --allow-root --path=/var/www/html/wp_server
    wp config create --allow-root --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --path=/var/www/html/wp_server
    wp core install  --allow-root --url=${WEB_URL} --title="${WEB_TITLE}" --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --path=/var/www/html/wp_server
    wp user create   --allow-root ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_USER_PASSWORD} --role=subscriber  --path=/var/www/html/wp_server
fi
#Notificamos en los logs que hemos terminado
echo "\033[32mWordPress set up finished\033[0m"
#Arrancamos php-fpm en segundo plano 
exec php-fpm7.3 -F