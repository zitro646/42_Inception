#Getting base image
#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

ARG MYSQL_DATABASE_NAME 
ARG MYSQL_ADMIN_USER 
ARG MYSQL_USER_PASSWORD

RUN mkdir input_data

#Copio el archivo .sql y lo muevo a una carpeta para su uso posterior
COPY ./database_example.sql input_data/database_example.sql
COPY ./config.sh /config.sh

# Actualizo e instalo los paquetes necesarios
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

#RUN mysql_secure_installation

#Inicio mariadb injectandole el .sql
RUN	service mysql start && mysql < input_data/database_example.sql

RUN chmod +x config.sh

RUN ./config.sh

CMD ["mysqld"]