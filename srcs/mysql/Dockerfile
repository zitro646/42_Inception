#Getting base image
#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

ENV MYSQL_ROOT_PASSWORD=root

RUN mkdir fichero

COPY ./database_example.sql input_data/database_example.sql

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y
#RUN mysql_secure_installation

RUN	service mysql start && mysql < input_data/database_example.sql

CMD ["mysqld"]