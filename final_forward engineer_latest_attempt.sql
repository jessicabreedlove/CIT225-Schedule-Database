-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema final
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `final` ;

-- -----------------------------------------------------
-- Schema final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `final` DEFAULT CHARACTER SET utf8 ;
USE `final` ;

-- -----------------------------------------------------
-- Table `final`.`child`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`child` ;

CREATE TABLE IF NOT EXISTS `final`.`child` (
  `child_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  PRIMARY KEY (`child_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`activity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`activity_category` ;

CREATE TABLE IF NOT EXISTS `final`.`activity_category` (
  `activity_category_id` INT NOT NULL AUTO_INCREMENT,
  `activity_category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`activity_category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`activity` ;

CREATE TABLE IF NOT EXISTS `final`.`activity` (
  `activity_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(25) NOT NULL,
  `activity_category_id` INT NOT NULL,
  PRIMARY KEY (`activity_id`, `activity_category_id`),
  INDEX `fk_Activity_Activity_Types1_idx` (`activity_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_Activity_Activity_Types1`
    FOREIGN KEY (`activity_category_id`)
    REFERENCES `final`.`activity_category` (`activity_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`location` ;

CREATE TABLE IF NOT EXISTS `final`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_address` VARCHAR(45) NOT NULL,
  `location_city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`location_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`location_type` ;

CREATE TABLE IF NOT EXISTS `final`.`location_type` (
  `location_type_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`location_type_at_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`location_type_at_location` ;

CREATE TABLE IF NOT EXISTS `final`.`location_type_at_location` (
  `location_id` INT NOT NULL,
  `location_type_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `location_type_id`),
  INDEX `fk_Location_has_location_type_location_type1_idx` (`location_type_id` ASC) VISIBLE,
  INDEX `fk_Location_has_location_type_Location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Location_has_location_type_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `final`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_has_location_type_location_type1`
    FOREIGN KEY (`location_type_id`)
    REFERENCES `final`.`location_type` (`location_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`employee` ;

CREATE TABLE IF NOT EXISTS `final`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`scheduled_activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`scheduled_activities` ;

CREATE TABLE IF NOT EXISTS `final`.`scheduled_activities` (
  `scheduled_activities_id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`scheduled_activities_id`, `location_id`, `activity_id`, `employee_id`),
  INDEX `fk_scheduled_activities_Location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_scheduled_activities_Activity1_idx` (`activity_id` ASC) VISIBLE,
  INDEX `fk_scheduled_activities_professional1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_scheduled_activities_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `final`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scheduled_activities_Activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `final`.`activity` (`activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scheduled_activities_professional1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `final`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`profession_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`profession_type` ;

CREATE TABLE IF NOT EXISTS `final`.`profession_type` (
  `profession_type_id` INT NOT NULL AUTO_INCREMENT,
  `profession` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`profession_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`employee_at_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`employee_at_location` ;

CREATE TABLE IF NOT EXISTS `final`.`employee_at_location` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `location_type_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `location_type_id`),
  INDEX `fk_professional_has_location_type_location_type1_idx` (`location_type_id` ASC) VISIBLE,
  INDEX `fk_professional_has_location_type_professional1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_professional_has_location_type_professional1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `final`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professional_has_location_type_location_type1`
    FOREIGN KEY (`location_type_id`)
    REFERENCES `final`.`location_type` (`location_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`child_has_scheduled_activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`child_has_scheduled_activities` ;

CREATE TABLE IF NOT EXISTS `final`.`child_has_scheduled_activities` (
  `child_id` INT NOT NULL,
  `scheduled_activities_id` INT NOT NULL,
  PRIMARY KEY (`child_id`, `scheduled_activities_id`),
  INDEX `fk_Child_has_scheduled_activities_scheduled_activities1_idx` (`scheduled_activities_id` ASC) VISIBLE,
  INDEX `fk_Child_has_scheduled_activities_Child1_idx` (`child_id` ASC) VISIBLE,
  CONSTRAINT `fk_Child_has_scheduled_activities_Child1`
    FOREIGN KEY (`child_id`)
    REFERENCES `final`.`child` (`child_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Child_has_scheduled_activities_scheduled_activities1`
    FOREIGN KEY (`scheduled_activities_id`)
    REFERENCES `final`.`scheduled_activities` (`scheduled_activities_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `final`.`employee_profession_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `final`.`employee_profession_type` ;

CREATE TABLE IF NOT EXISTS `final`.`employee_profession_type` (
  `employee_id` INT NOT NULL,
  `profession_type_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `profession_type_id`),
  INDEX `fk_employee_has_profession_type_profession_type1_idx` (`profession_type_id` ASC) VISIBLE,
  INDEX `fk_employee_has_profession_type_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_profession_type_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `final`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_profession_type_profession_type1`
    FOREIGN KEY (`profession_type_id`)
    REFERENCES `final`.`profession_type` (`profession_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
