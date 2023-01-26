#Getting base image
#WordPress

FROM debian:buster

LABEL MAINTAINER=mortiz-d

COPY script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

# Actualizo e instalo los paquetes necesarios
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client
#php-fpm php-mysql

# Descargo Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir var/www/ && mkdir var/www/html && mkdir var/www/html/wp_server

#--path=/wptest


CMD ["sh","/usr/local/bin/script.sh"]


















#Inicializo MYSQL client
#mysql -u pepe -ppass -h mariadb
#CMD mysqladmin -u root -p status



#Creo el archivo config desde WP CLI
#wp config create --allow-root --path=/wptest --dbname=CLIENTS --dbuser=pepe --dbhost=mariadb --dbpass=pass
#CMD wp config create --allow-root --path=/wptest --dbnaame=CLIENTS --dbuser=root --dbhost=mariadb
