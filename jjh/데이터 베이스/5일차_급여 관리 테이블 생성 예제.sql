CREATE TABLE `company`.`employee` (
  `em_num` INT NOT NULL,
  `em_reg_num` CHAR(14) NOT NULL,
  `em_name` VARCHAR(45) NOT NULL,
  `em_sa_level` VARCHAR(4) NOT NULL,
  `em_year` INT NOT NULL,
  `em_join_year` INT NOT NULL,
  `em_de_department` VARCHAR(10) NULL,
  PRIMARY KEY (`em_num`),
  UNIQUE INDEX `em_reg_num_UNIQUE` (`em_reg_num` ASC) VISIBLE);
  
  CREATE TABLE `company`.`department` (
  `de_department` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`de_department`));

CREATE TABLE `company`.`salary` (
  `sa_level` VARCHAR(4) NOT NULL,
  `sa_base_salary` INT NOT NULL,
  `sa_add_salary` INT NOT NULL,
  PRIMARY KEY (`sa_level`));
  
  CREATE TABLE `company`.`salary` (
  `sa_level` VARCHAR(4) NOT NULL,
  `sa_base_salary` INT NOT NULL,
  `sa_add_salary` INT NOT NULL,
  PRIMARY KEY (`sa_level`));

