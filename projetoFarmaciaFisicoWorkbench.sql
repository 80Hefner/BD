-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjetoFarmácia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjetoFarmácia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetoFarmácia` DEFAULT CHARACTER SET utf8 ;
USE `ProjetoFarmácia` ;

-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`Cliente` (
  `id_Cliente` INT NOT NULL,
  `Nome` VARCHAR(80) NOT NULL,
  `NIF` INT NULL,
  `Telemovel` INT NOT NULL,
  `E-Mail` VARCHAR(100) NULL,
  `Palavra-Chave` VARCHAR(30) NOT NULL,
  `Cidade` VARCHAR(75) NULL,
  `Código-Postal` VARCHAR(20) NULL,
  `Rua` VARCHAR(75) NULL,
  PRIMARY KEY (`id_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`Funcionário` (
  `id_Funcionário` INT NOT NULL,
  `Nome` VARCHAR(80) NOT NULL,
  `IBAN` VARCHAR(25) NOT NULL,
  `NISS` VARCHAR(11) NOT NULL,
  `Telemovel` VARCHAR(20) NOT NULL,
  `E-Mail` VARCHAR(100) NULL,
  `Cidade` VARCHAR(75) NULL,
  `Código-Postal` VARCHAR(20) NULL,
  `Rua` VARCHAR(75) NULL,
  `Salário` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_Funcionário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`Fatura` (
  `id_Fatura` INT NOT NULL,
  `Data-Fatura` DATETIME NOT NULL,
  `Desconto` INT NOT NULL,
  `IVA` INT NOT NULL,
  `Preco-Total` DECIMAL(6,2) NOT NULL,
  `Funcionário_id_Funcionário` INT NOT NULL,
  `Cliente_id_Cliente` INT NOT NULL,
  PRIMARY KEY (`id_Fatura`),
  INDEX `fk_Fatura_Funcionário_idx` (`Funcionário_id_Funcionário` ASC) VISIBLE,
  INDEX `fk_Fatura_Cliente1_idx` (`Cliente_id_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_Funcionário`
    FOREIGN KEY (`Funcionário_id_Funcionário`)
    REFERENCES `ProjetoFarmácia`.`Funcionário` (`id_Funcionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_Cliente1`
    FOREIGN KEY (`Cliente_id_Cliente`)
    REFERENCES `ProjetoFarmácia`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`ReceitasFatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`ReceitasFatura` (
  `cod_Receita` INT NOT NULL,
  `Fatura_id_Fatura` INT NOT NULL,
  PRIMARY KEY (`cod_Receita`, `Fatura_id_Fatura`),
  INDEX `fk_ReceitasFatura_Fatura1_idx` (`Fatura_id_Fatura` ASC) VISIBLE,
  CONSTRAINT `fk_ReceitasFatura_Fatura1`
    FOREIGN KEY (`Fatura_id_Fatura`)
    REFERENCES `ProjetoFarmácia`.`Fatura` (`id_Fatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`Produto-Famacêutico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`Produto-Famacêutico` (
  `id_Produto` INT NOT NULL,
  `Designação` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Laboratório` VARCHAR(45) NOT NULL,
  `Receita` CHAR(1) BINARY NOT NULL,
  `Validade` DATETIME NOT NULL,
  `Unidades-Embalagem` VARCHAR(10) NOT NULL,
  `Quantidade-Embalagem` DECIMAL(6,2) NOT NULL,
  `EmbalagensEmStock` INT NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_Produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmácia`.`Linha-Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmácia`.`Linha-Fatura` (
  `Preco-Unitário` DECIMAL(6,2) NOT NULL,
  `Preco-Total` DECIMAL(6,2) NOT NULL,
  `Quantidade` INT NOT NULL,
  `Fatura_id_Fatura` INT NOT NULL,
  `Produto-Famacêutico_id_Produto` INT NOT NULL,
  PRIMARY KEY (`Fatura_id_Fatura`, `Produto-Famacêutico_id_Produto`),
  INDEX `fk_Linha-Fatura_Produto-Famacêutico1_idx` (`Produto-Famacêutico_id_Produto` ASC) VISIBLE,
  CONSTRAINT `fk_Linha-Fatura_Fatura1`
    FOREIGN KEY (`Fatura_id_Fatura`)
    REFERENCES `ProjetoFarmácia`.`Fatura` (`id_Fatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linha-Fatura_Produto-Famacêutico1`
    FOREIGN KEY (`Produto-Famacêutico_id_Produto`)
    REFERENCES `ProjetoFarmácia`.`Produto-Famacêutico` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
