#MySQL
FROM debian:buster

LABEL MAINTAINER=mortiz-d

ARG MYSQL_DATABASE_NAME MYSQL_ADMIN_USER MYSQL_USER_PASSWORD MYSQL_ROOT_PASSWORD

# Actualizo e instalo los paquetes necesarios
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server net-tools -y

#Copio el archivo configuracion y lo ejecuto
COPY ./config.sh /config.sh
RUN chmod +x config.sh && ./config.sh

#Inicio mariadb injectandole el .sql
RUN	service mysql start && mysql < database.sql 

CMD ["mysqld"]