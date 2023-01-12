#Getting base image
#WordPress

FROM debian:buster

LABEL MAINTAINER=mortiz-d

RUN  apt-get update -y && apt-get upgrade -y

RUN apt-get install apache2 mariadb-server libapache2-modphp mariadb-client -y

RUN apt install php php-mysql -y
