SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema drone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema drone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `drone` DEFAULT CHARACTER SET utf8 ;
USE `drone` ;

-- -----------------------------------------------------
-- Table `drone`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drone`.`user` ;

CREATE TABLE IF NOT EXISTS `drone`.`user` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `token` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`drone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drone`.`drone` ;

CREATE TABLE IF NOT EXISTS `drone`.`drone` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `brand` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `additional_info` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`flight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drone`.`flight` ;

CREATE TABLE IF NOT EXISTS `drone`.`flight` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `drone_id` INT NOT NULL,
  INDEX `fk_user_has_drone_drone1_idx` (`drone_id` ASC) VISIBLE,
  INDEX `fk_user_has_drone_user_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_has_drone_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `drone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_drone_drone1`
    FOREIGN KEY (`drone_id`)
    REFERENCES `drone`.`drone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drone`.`image` ;

CREATE TABLE IF NOT EXISTS `drone`.`image` (
  `id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `analysis` VARCHAR(45) NULL,
  `location_info` VARCHAR(45) NULL,
  `image_taken` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_image_flight1_idx` (`flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_image_flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `drone`.`flight` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`drone_in_use`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drone`.`drone_in_use` ;

CREATE TABLE IF NOT EXISTS `drone`.`drone_in_use` (
  `user_id` INT NOT NULL,
  `drone_id` INT NOT NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  PRIMARY KEY (`user_id`, `drone_id`),
  INDEX `fk_user_has_drone_drone2_idx` (`drone_id` ASC) VISIBLE,
  INDEX `fk_user_has_drone_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_drone_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `drone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_drone_drone2`
    FOREIGN KEY (`drone_id`)
    REFERENCES `drone`.`drone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
