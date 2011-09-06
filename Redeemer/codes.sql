CREATE TABLE  `codes` (
 `id` INT NOT NULL AUTO_INCREMENT ,
 `code` VARCHAR( 12 ) NOT NULL ,
 `issue` VARCHAR( 6 ) NOT NULL ,
 `redeemed` BOOL NOT NULL ,
PRIMARY KEY (  `id` )
) TYPE = MYISAM ;