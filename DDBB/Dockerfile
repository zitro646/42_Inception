#MYSQL

#Getting base image
FROM mysql

# WHO                                   ASKED
MAINTAINER mortiz-d

#ENV Variables
ENV MYSQL_ROOT_PASSWORD root


#RUN apt-get update


COPY ./database_example.sql /docker-entrypoint-initdb.d

EXPOSE 3306