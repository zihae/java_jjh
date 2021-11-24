-- CREATE DATABASE fruit_jjh;
USE fruit_jjh;
CREATE TABLE `fruit` (
	`fr_name`	VARCHAR(30)	NOT NULL,
	`fr_price`	INT	NOT NULL DEFAULT 0,
	`fr_amount`	INT	NOT NULL DEFAULT 0,
	`fr_unit`	VARCHAR(10)	NULL 
);

CREATE TABLE `buy` (
	`bu_num`	INT	NOT NULL AUTO_INCREMENT,
    `bu_fr_name` VARCHAR(30) NOT NULL,
	`bu_amount`	INT	NOT NULL DEFAULT 0,
	`bu_date`	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`bu_unit`	VARCHAR(10)	NULL,
	`bu_st_name`	VARCHAR(20)	NOT NULL,
    PRIMARY KEY(`bu_num`)
);

CREATE TABLE `sell` (
	`se_num`	INT	NOT NULL AUTO_INCREMENT,
    `se_fr_name`	VARCHAR(30)	NOT NULL,
	`se_amount`	INT	NOT NULL DEFAULT 0,
	`se_unit`	VARCHAR(10)	NULL,
	`se_price`	INT	NOT NULL DEFAULT 0,
	`se_date`	DATETIME NOT NULL DEFAULT NOW(),
	`se_type`	VARCHAR(4)	NOT NULL,
    PRIMARY KEY(`se_num`)
);

CREATE TABLE `store` (
	`st_name`	VARCHAR(20)	NOT NULL,
	`st_address`	VARCHAR(50)	NULL
);

ALTER TABLE `fruit` ADD CONSTRAINT `PK_FRUIT` PRIMARY KEY (
	`fr_name`
);

ALTER TABLE `buy` ADD CONSTRAINT `PK_BUY` PRIMARY KEY (
	`bu_num`
);

ALTER TABLE `sell` ADD CONSTRAINT `PK_SELL` PRIMARY KEY (
	`se_num`
);

ALTER TABLE `store` ADD CONSTRAINT `PK_STORE` PRIMARY KEY (
	`st_name`
);

ALTER TABLE `buy` ADD CONSTRAINT `FK_BUY_FRUIT` FOREIGN KEY (
	`bu_fr_name`
) REFERENCES `fruit`(`fr_name`);

ALTER TABLE `buy` ADD CONSTRAINT `FK_BUY_STORE` FOREIGN KEY (
	`bu_st_name`
) REFERENCES `store`(`st_name`);

ALTER TABLE `sell` ADD CONSTRAINT `FK_SELL_FRUIT` FOREIGN KEY (
	`se_fr_name`
) REFERENCES `fruit`(`fr_name`);




