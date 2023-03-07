#Añadimos este directorio
mkdir -p /run/php/
#Modificamos el archivo www.conf para que escuche cualquier IP en ese puerto
sed -i "s#listen = /run/php/php7.3-fpm.sock#listen = 0.0.0.0:9000#" /etc/php/7.3/fpm/pool.d/www.conf

#Con esto descargamos y configuramos el server WP CLI si se ejecuta por primera vez
if [ ! -d "/var/www/html/wp_server" ]; then
    wp core download --allow-root --path=/var/www/html/wp_server
    wp config create --allow-root --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --path=/var/www/html/wp_server
    wp core install --allow-root --url=${WEB_URL} --title="${WEB_TITLE}" --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=42_Inception@gmail.com --skip-email --path=/var/www/html/wp_server
    #En esta parte añadimos el bonus redis-cache
    if [ ${BONUS} ]; then
        #instalamos redis en nuestro docker
        mkdir -p /var/run/redis
        apt-get install -y redis nano php7.3-redis
        #Configuramos el archivo redis.conf
        sed -i "s%# unixsocket /var/run/redis/redis-server.sock%unixsocket /var/run/redis/redis-server.sock%" /etc/redis/redis.conf
        sed -i "s%# unixsocketperm 700%unixsocketperm 777%" /etc/redis/redis.conf
        sed -i "s%# maxmemory <bytes>%maxmemory 128mb%" /etc/redis/redis.conf
        sed -i "s%# maxmemory-policy noeviction%maxmemory-policy allkeys-lru%" /etc/redis/redis.conf
        #Modificamos wp-config.php para que puede acceder al archivo
        echo "\n\n/** Redis-cache configuration */" >> /var/www/html/wp_server/wp-config.php 
        echo "define( 'WP_REDIS_PATH', '/var/run/redis/redis-server.sock' );" >> /var/www/html/wp_server/wp-config.php 
        echo "define( 'WP_REDIS_SCHEME', 'unix' );" >> /var/www/html/wp_server/wp-config.php 
        #Iniciamos redis
        /etc/init.d/redis-server start
        #instalamos el plugin redis-cache con wp cli
        wp plugin install redis-cache --allow-root --activate --path=var/www/html/wp_server
    fi
fi
#Arrancamos php-fpm en segundo plano 
exec php-fpm7.3 -F