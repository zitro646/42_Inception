#Getting base image
#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

ENV MYSQL_ROOT_PASSWORD=root

RUN mkdir archivo_prueba

COPY ./database_example.sql archivo_prueba/database_example.sql

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y
#RUN mysql_secure_installation

RUN	service mysql start && mysql < archivo_prueba/database_example.sql

CMD ["mysqld"]