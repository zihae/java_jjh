
CREATE SCHEMA `community` ;
USE community;

CREATE TABLE `member` (
	`me_id`	VARCHAR(20)	NOT NULL,
	`me_pw`	VARCHAR(255)	NULL,
	`me_name`	VARCHAR(30)	NULL,
	`me_gender`	VARCHAR(6)	NULL,
	`me_birth`	DATE	NULL,
	`me_address`	VARCHAR(100)	NULL,
	`me_phone`	VARCHAR(13)	NULL
);

CREATE TABLE `board` (
	`bd_num`	INT	NOT NULL,
	`bd_title`	VARCHAR(100)	NULL,
	`bd_contents`	LONGTEXT	NULL,
	`bd_reg_date`	DATETIME	NULL,
	`bd_up_date`	DATETIME	NULL,
	`bd_type`	VARCHAR(10)	NULL,
	`bd_me_id`	VARCHAR(20)	NOT NULL,
	`bd_ori_num`	INT	NOT NULL,
	`bd_del`	VARCHAR(2)	NULL,
	`bd_del_date`	DATETIME	NULL
);

CREATE TABLE `file` (
	`fi_num`	INT	NOT NULL,
	`fi_ori_name`	VARCHAR(255)	NULL,
	`fi_name`	VARCHAR(255)	NULL,
	`fi_bd_num`	INT	NOT NULL,
	`fi_del`	VARCHAR(2)	NULL,
	`fi_del_date`	DATETIME	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`bd_num`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
	`fi_num`
);

ALTER TABLE `community`.`file` 
CHANGE COLUMN `fi_num` `fi_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `community`.`board` 
CHANGE COLUMN `bd_num` `bd_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`bd_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_board_TO_board_1` FOREIGN KEY (
	`bd_ori_num`
)
REFERENCES `board` (
	`bd_num`
);

ALTER TABLE `file` ADD CONSTRAINT `FK_board_TO_file_1` FOREIGN KEY (
	`fi_bd_num`
)
REFERENCES `board` (
	`bd_num`
);