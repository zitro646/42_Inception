CREATE DATABASE IF NOT EXISTS CLIENTS character set latin1 collate latin1_general_cs; 
CREATE USER IF NOT EXISTS 'pepe'@'%' IDENTIFIED BY 'pass' ;
GRANT ALL PRIVILEGES ON *.* TO 'pepe'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;
ALTER USER root@localhost IDENTIFIED BY '' ;

--CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};
--CREATE USER IF NOT EXISTS ${MYSQL_ADMIN_USER} IDENTIFIED BY ${MYSQL_USER_PASSWORD};
--GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_ADMIN_USER} IDENTIFIED BY ${MYSQL_USER_PASSWORD};
--FLUSH PRIVILEGES;
--ALTER USER 'root'@'localhost' IDENTIFIED BY ${MYSQL_ROOT_PASSWORD};
--use CLIENTS;

--CREATE TABLE buyers(
--    numbered_ID  int not NULL AUTO_INCREMENT,
--    FirstName   varchar(255) NOT NULL,
--    LastName    varchar(255) NOT NULL,
--    PRIMARY KEY (numbered_ID)
--);

--INSERT INTO buyers(FirstName,LastName) 
--VALUES ("Miguel","Ortiz"), ("Pepe","Tolay"),("Xavi", "Aflorao"), ("Juan", "Narniano")
