#Añadimos este directorio
mkdir -p /run/php/
#Modificamos el archivo www.conf para que escuche cualquier IP en ese puerto
sed -i "s#listen = /run/php/php7.3-fpm.sock#listen = 0.0.0.0:9000#" /etc/php/7.3/fpm/pool.d/www.conf

#Con esto descargamos y configuramos el server WP CLI si se ejecuta por primera vez
if [ ! -d "/var/www/html/wp_server" ]; then
    wp core download --allow-root --path=var/www/html/wp_server
    wp config create --allow-root --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --path=var/www/html/wp_server
    wp core install --allow-root --url=mortiz-d.42.fr --title="WP CLI Demo" --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=42_Inception@gmail.com --skip-email --path=var/www/html/wp_server
fi
#Arrancamos php-fpm en segundo plano 
exec php-fpm7.3 -F