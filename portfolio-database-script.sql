-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio_Jr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_Jr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_Jr` DEFAULT CHARACTER SET utf8 ;
USE `portfolio_Jr` ;

-- -----------------------------------------------------
-- Table `portfolio_Jr`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`domicilio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_Jr`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apelido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `profesion` VARCHAR(45) NOT NULL,
  `foto de perfil` VARCHAR(45) NULL,
  `domicilio_id` INT NOT NULL,
  PRIMARY KEY (`id`, `domicilio_id`),
  INDEX `fk_persona_domicilio1_idx` (`domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_persona_domicilio1`
    FOREIGN KEY (`domicilio_id`)
    REFERENCES `portfolio_Jr`.`domicilio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_Jr`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NOT NULL,
  `fecha_de_ingreso` DATE NOT NULL,
  `fecha_de finalizacion` DATE NULL,
  `localizacion` VARCHAR(45) NOT NULL,
  `puesto` VARCHAR(45) NOT NULL,
  `tipo de jornada` VARCHAR(45) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_experiencia_persona_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_Jr`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_Jr`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_Jr`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `instituto` VARCHAR(45) NOT NULL,
  `carrera` VARCHAR(45) NOT NULL,
  `año_de_inicio` YEAR(5) NOT NULL,
  `año_def_finalizacion` YEAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_Jr`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_Jr`.`tecnologias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habilidad` VARCHAR(45) NOT NULL,
  `porcentaje` FLOAT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
