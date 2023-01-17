#Getting base image
#WordPress

FROM debian:buster

LABEL MAINTAINER=mortiz-d

RUN mkdir wptest
# Actualizo e instalo los paquetes necesarios
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y apache2 php php-mysql libapache2-mod-php mariadb-client

# Descargo y monto WordPress manualmente
#RUN curl https://wordpress.org/latest.tar.gz -o latest.tar.gz && \
#    tar -xzvf latest.tar.gz && \
#    rm latest.tar.gz && \
#    mv wordpress /var/www/html/ && \
#    chown -R www-data:www-data /var/www/html/wordpress

# Descargo Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#Descargo wordpress desde WP CLI
#--allow-root --path=/var/www/html
RUN wp core download --allow-root --path=wptest

#CMD cat /etc/mysql/my.cnf
#Creo el archivo config desde WP CLI
#CMD wp config create --allow-root --path=/wptest --dbname=CLIENTS --dbuser=root
