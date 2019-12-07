--<ScriptOptions statementTerminator=";"/>
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  login varchar(45) DEFAULT NULL ,
  password varchar(45) DEFAULT NULL ,
  mDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ,
  uDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (id)
);
