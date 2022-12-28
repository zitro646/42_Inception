CREATE DATABASE example;
use example;

CREATE TABLE examples(
    example_ID  int not NULL AUTO_INCREMENT,
    FirstName   varchar(255) NOT NULL,
    LastName    varchar(255) NOT NULL,
    PRIMARY KEY (example_ID)
);

INSTERT  INTO examples(FirstName,LastName) 
VALUES ("Miguel","Ortiz"), ("Pepe","Tolay"),
("Xavi", "Flores"), ("Juan", "Murciano")