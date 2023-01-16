#Getting base image
#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

RUN mkdir fichero

#Copio el archivo .sql y lo muevo a una carpeta para su uso posterior
COPY ./database_example.sql input_data/database_example.sql

# Actualizo e instalo los paquetes necesarios
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

#RUN mysql_secure_installation

#Inicio mariadb injectandole el .sql
RUN	service mysql start && mysql < input_data/database_example.sql

CMD ["mysqld"]