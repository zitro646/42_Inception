#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

ARG MYSQL_DATABASE_NAME MYSQL_ADMIN_USER MYSQL_USER_PASSWORD MYSQL_ROOT_PASSWORD

RUN mkdir input_data

#Copio el archivo .sql y lo muevo a una carpeta para su uso posterior
COPY ./config.sh /config.sh
COPY ./database_config.sql /database_config.sql
RUN chmod +x config.sh
RUN ./config.sh

# Actualizo e instalo los paquetes necesarios
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server net-tools -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#Inicio mariadb injectandole el .sql
RUN	service mysql start && mysql < database_config.sql 
#input_data/test.sql

#RUN mysql_secure_installation

CMD ["mysqld"]