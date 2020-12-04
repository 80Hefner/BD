-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjetoFarmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjetoFarmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetoFarmacia` DEFAULT CHARACTER SET utf8 ;
USE `ProjetoFarmacia` ;

-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `NIF` VARCHAR(9) NULL,
  `Telemovel` VARCHAR(20) NOT NULL,
  `eMail` VARCHAR(45) NULL,
  `Pass` VARCHAR(30) NOT NULL,
  `Cidade` VARCHAR(30) NULL,
  `CodigoPostal` VARCHAR(45) NULL,
  `Rua` VARCHAR(50) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `IBAN` VARCHAR(25) NOT NULL,
  `NISS` VARCHAR(11) NOT NULL,
  `Telemovel` VARCHAR(20) NOT NULL,
  `Salario` DECIMAL(6,2) NOT NULL,
  `Pass` VARCHAR(30) NOT NULL,
  `eMail` VARCHAR(45) NULL,
  `Cidade` VARCHAR(30) NULL,
  `CodigoPostal` VARCHAR(45) NULL,
  `Rua` VARCHAR(50) NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Fatura` (
  `idFatura` INT NOT NULL,
  `Funcionario` INT NOT NULL,
  `Cliente` INT NOT NULL,
  `DataFatura` DATETIME NOT NULL,
  `Desconto` INT NOT NULL,
  `IVA` INT NOT NULL,
  `PrecoTotal` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idFatura`),
  INDEX `fk_Fatura_Funcionário_idx` (`Funcionario` ASC) VISIBLE,
  INDEX `fk_Fatura_Cliente1_idx` (`Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_Funcionário`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `ProjetoFarmacia`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `ProjetoFarmacia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Produto` (
  `idProduto` INT NOT NULL,
  `Designacao` VARCHAR(20) NOT NULL,
  `Laboratorio` VARCHAR(75) NOT NULL,
  `Administracao` VARCHAR(20) NOT NULL,
  `ReceitaMedica` CHAR(1) NOT NULL,
  `Dosagem` VARCHAR(20) NOT NULL,
  `QuantidadeEmbalagem` INT NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Validade` DATETIME NOT NULL,
  `EmbalagensEmStock` INT NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`LinhaFatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`LinhaFatura` (
  `Fatura` INT NOT NULL,
  `Produto` INT NOT NULL,
  `PrecoUnitario` DECIMAL(6,2) NOT NULL,
  `PrecoTotal` DECIMAL(6,2) NOT NULL,
  `Quantidade` INT NOT NULL,
  INDEX `fk_Linha-Fatura_Produto-Famacêutico1_idx` (`Produto` ASC) VISIBLE,
  PRIMARY KEY (`Fatura`, `Produto`),
  CONSTRAINT `fk_Linha-Fatura_Fatura1`
    FOREIGN KEY (`Fatura`)
    REFERENCES `ProjetoFarmacia`.`Fatura` (`idFatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linha-Fatura_Produto-Famacêutico1`
    FOREIGN KEY (`Produto`)
    REFERENCES `ProjetoFarmacia`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
