#WordPress
FROM debian:buster

LABEL MAINTAINER=mortiz-d

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

# Actualizo e instalo los paquetes necesarios
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client

# Descargo Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

CMD ["sh","/usr/local/bin/script.sh"]