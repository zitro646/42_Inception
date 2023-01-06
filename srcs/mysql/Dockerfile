#Getting base image
#MySQL

FROM debian:buster

LABEL MAINTAINER=mortiz-d

ENV MYSQL_ROOT_PASSWORD=root

COPY ./database_example.sql database_example.sql

RUN apt-get update && apt-get upgrade && apt-get autoremove && apt-get install mariadb-server -y

#RUN mysql_secure_installation

EXPOSE 3306

RUN	service mysql --lower_case_table_names=0 start && mysql < database_example.sql

CMD ["mysqld"]